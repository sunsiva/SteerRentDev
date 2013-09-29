using Common.Services;
using System;
using System.Collections.Specialized;
using System.Web.Security;
using uNext.Data.Models;
using uNext.Data.Models.Sales;
using uNext.Helpers;
using uNext.Security;
using uNext.Services.Contracts;
using uNext.Services.Models.MyProfile;

namespace uNext.Membership
{
    public class MembershipProvider : System.Web.Security.MembershipProvider
    {
        #region Properties

        private int maxInvalidPasswordAttempts;

        private int minRequiredNonalphanumericCharacters;

        private int minRequiredPasswordLength;

        private int passwordAttemptWindow;

        private string passwordStrengthRegularExpression;

        // NOTE: keep for future use.
        //private bool _EnablePasswordRetrieval;
        //private bool _EnablePasswordReset;
        //private bool _RequiresQuestionAndAnswer;
        private bool requiresUniqueEmail;

        public override string ApplicationName
        {
            get { return GetType().Assembly.GetName().Name; }
            set
            {
                if (value == null) throw new ArgumentNullException("value");
                ApplicationName = GetType().Assembly.GetName().Name;
            }
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return maxInvalidPasswordAttempts; }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return minRequiredNonalphanumericCharacters; }
        }

        public override int MinRequiredPasswordLength
        {
            get { return minRequiredPasswordLength; }
        }

        public override int PasswordAttemptWindow
        {
            get { return passwordAttemptWindow; }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { return MembershipPasswordFormat.Hashed; }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { return passwordStrengthRegularExpression; }
        }

        public override bool RequiresUniqueEmail
        {
            get { return requiresUniqueEmail; }
        }

        #endregion Properties

        #region Functions

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (string.IsNullOrEmpty(username))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(oldPassword))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(newPassword))
                {
                    return false;
                }
                var customer = customerBo.Client.GetMembershipInfo(username);

                if (customer == null)
                {
                    return false;
                }
                var hashedPassword = customer.Password;
                var verificationSucceeded = (hashedPassword != null &&
                                             Crypto.VerifyHashedPassword(hashedPassword, oldPassword));
                if (verificationSucceeded)
                {
                    customer.PasswordFailuresSinceLastSuccess = 0;
                }
                else
                {
                    var failures = customer.PasswordFailuresSinceLastSuccess;
                    if (failures < MaxInvalidPasswordAttempts)
                    {
                        customer.PasswordFailuresSinceLastSuccess += 1;
                        customer.LastPasswordFailureDate = DateTime.UtcNow;
                    }
                    else if (failures >= MaxInvalidPasswordAttempts)
                    {
                        customer.LastPasswordFailureDate = DateTime.UtcNow;
                        customer.LastLockoutDate = DateTime.UtcNow;
                        customer.IsLockedOut = true;
                    }
                    customerBo.Client.SaveMembershipViewModel(customer);
                    return false;
                }
                var newHashedPassword = Crypto.HashPassword(newPassword);
                if (newHashedPassword.Length > 128)
                {
                    return false;
                }
                customer.Password = newHashedPassword;
                customer.LastPasswordChangedDate = DateTime.UtcNow;
                customerBo.Client.SaveMembershipViewModel(customer);
                return true;
            }
        }

        public static bool ChangePassword(string username, string newPassword)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (string.IsNullOrEmpty(username))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(newPassword))
                {
                    return false;
                }
                var customer = customerBo.Client.GetMembershipInfo(username);

                if (customer == null)
                {
                    return false;
                }
                customer.PasswordFailuresSinceLastSuccess = 0;
                var newHashedPassword = Crypto.HashPassword(newPassword);
                if (newHashedPassword.Length > 128)
                {
                    return false;
                }
                customer.Password = newHashedPassword;
                customer.LastPasswordChangedDate = DateTime.UtcNow;
                customerBo.Client.SaveMembershipViewModel(customer);
                return true;
            }
        }

        public override MembershipUser CreateUser(string username, string password, string email,
                                                  string passwordQuestion, string passwordAnswer, bool isApproved,
                                                  object providerUserKey, out MembershipCreateStatus status)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            if (string.IsNullOrEmpty(username))
            {
                return false;
            }
            return false;
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize,
                                                                  out int totalRecords)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                var membershipUsers = new MembershipUserCollection();
                var customers = customerBo.Client.GetMembershipUsers(new Searchable
                {
                    SearchString =
                        String.Format("{0}.Contains(\"{1}\")", "Email",
                                      emailToMatch),
                    CurrentPage = pageIndex,
                    PageSize = pageSize,
                    SortColumn = "Username"
                });
                totalRecords = customers.TotalItemCount;

                foreach (var customer in customers.Entities)
                {
                    membershipUsers.Add(BuildUser(customer));
                }
                return membershipUsers;
            }
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize,
                                                                 out int totalRecords)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                var membershipUsers = new MembershipUserCollection();
                var customers = customerBo.Client.GetMembershipUsers(new Searchable
                {
                    SearchString =
                        String.Format("{0}.Contains(\"{1}\")", "Username",
                                      usernameToMatch),
                    CurrentPage = pageIndex,
                    PageSize = pageSize,
                    SortColumn = "Username"
                });
                totalRecords = customers.TotalItemCount;

                foreach (var customer in customers.Entities)
                {
                    membershipUsers.Add(BuildUser(customer));
                }
                return membershipUsers;
            }
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                var membershipUsers = new MembershipUserCollection();
                var customers = customerBo.Client.GetMembershipUsers(new Searchable
                                                    {
                                                        CurrentPage = pageIndex,
                                                        PageSize = pageSize,
                                                        SortColumn = "Username"
                                                    });
                totalRecords = customers.TotalItemCount;

                foreach (var customer in customers.Entities)
                {
                    membershipUsers.Add(BuildUser(customer));
                }
                return membershipUsers;
            }
        }

        public override int GetNumberOfUsersOnline()
        {
            //var dateActive = DateTime.UtcNow.Subtract(TimeSpan.FromMinutes(Convert.ToDouble(System.Web.Security.Membership.UserIsOnlineTimeWindow)));

            //using (DataContext Context = new DataContext())
            //{
            //    return Context.Users.Where(Usr => Usr.LastActivityDate > dateActive).Count();
            //}
            return 0;
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (string.IsNullOrEmpty(username))
                {
                    return null;
                }
                var customer = customerBo.Client.GetMembershipInfo(username);

                if (customer == null) return null;

                customer.LastActivityDate = DateTime.UtcNow;
                customerBo.Client.SaveMembershipViewModel(customer);

                return BuildUser(customer);
            }
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (!(providerUserKey is Guid)) return null;

                var customerId = (int)providerUserKey;
                var custerName = customerBo.Client.GetCustomerInfo(customerId);
                var customer = customerBo.Client.GetMembershipInfo(custerName.Username);

                if (customer == null) return null;

                customer.LastActivityDate = DateTime.UtcNow;
                customerBo.Client.SaveMembershipViewModel(customer);

                return BuildUser(customer);
            }
        }

        public override string GetUserNameByEmail(string email)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (string.IsNullOrEmpty(email))
                {
                    return null;
                }
                var customers = customerBo.Client.GetCustomersByEmail(email);

                // We only return the first username
                return customers.Length == 0 ? null : customers[0].Username;
            }
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            maxInvalidPasswordAttempts = Converter.ConvertObjToInt(config["maxInvalidPasswordAttempts"]);
            minRequiredNonalphanumericCharacters =
                Converter.ConvertObjToInt(config["minRequiredNonalphanumericCharacters"]);
            minRequiredPasswordLength = Converter.ConvertObjToInt(config["minRequiredPasswordLength"]);
            passwordAttemptWindow = Converter.ConvertObjToInt(config["passwordAttemptWindow"]);
            passwordStrengthRegularExpression = Converter.ConvertObjToString(config["passwordStrengthRegularExpression"]);
            requiresUniqueEmail = Converter.ConvertObjToBool(config["requiresUniqueEmail"]);
            base.Initialize(name, config);
        }

        public override bool UnlockUser(string userName)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                var customer = customerBo.Client.GetMembershipInfo(userName);
                if (customer == null) return false;

                customer.IsLockedOut = false;
                customer.PasswordFailuresSinceLastSuccess = 0;
                customerBo.Client.SaveMembershipViewModel(customer);
                return true;
            }
        }

        public override bool ValidateUser(string username, string password)
        {
            using (var customerBo = new ClientFactory<ICustomer>())
            {
                if (string.IsNullOrEmpty(username))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(password))
                {
                    return false;
                }

                var customer = customerBo.Client.GetMembershipInfo(username);
                if (customer == null) return false;
                if (customer.CustomerStatus == CustomerStatus.Deactived) return false;
                if (customer.CustomerStatus == CustomerStatus.Suspended) return false;
                if (!(customer.CustomerStatus != CustomerStatus.Active || customer.CustomerStatus != CustomerStatus.DisabledWithMyPage)) return false;

                if (customer.IsLockedOut) return false;

                var hashedPassword = customer.Password;
                var verificationSucceeded = (hashedPassword != null && Crypto.VerifyHashedPassword(hashedPassword, password));
                if(password != null && password.Equals(customer.Password))
                {                    
                   verificationSucceeded = true;                    
                }

                if (verificationSucceeded)
                {
                    customer.PasswordFailuresSinceLastSuccess = 0;
                    customer.LastLoginDate = DateTime.UtcNow;
                    customer.LastActivityDate = DateTime.UtcNow;
                }
                else
                {
                    var failures = customer.PasswordFailuresSinceLastSuccess;
                    if (failures < MaxInvalidPasswordAttempts)
                    {
                        customer.PasswordFailuresSinceLastSuccess += 1;
                        customer.LastPasswordFailureDate = DateTime.UtcNow;
                    }
                    else if (failures >= MaxInvalidPasswordAttempts)
                    {
                        customer.LastPasswordFailureDate = DateTime.UtcNow;
                        customer.LastLockoutDate = DateTime.UtcNow;
                        customer.IsLockedOut = true;
                    }
                }
                customerBo.Client.SaveMembershipViewModel(customer);

                return verificationSucceeded;
            }
        }

        #endregion Functions

        private static MembershipUser BuildUser(MembershipViewModel customer)
        {
            return new MembershipUser(System.Web.Security.Membership.Provider.Name,
                customer.Username, customer.CustomerId, customer.Email, null, null,
                                      customer.CustomerStatus == CustomerStatus.Added ||
                                      customer.CustomerStatus == CustomerStatus.Active,
                                      customer.IsLockedOut, DateTime.UtcNow,
                DateTime.UtcNow, DateTime.UtcNow, DateTime.UtcNow, DateTime.UtcNow);
        }

        #region Not Supported

        //CodeFirstMembershipProvider does not support password reset scenarios.
        public override bool EnablePasswordReset
        {
            get { return false; }
        }

        //CodeFirstMembershipProvider does not support password retrieval scenarios.
        public override bool EnablePasswordRetrieval
        {
            get { return false; }
        }

        //CodeFirstMembershipProvider does not support question and answer scenarios.
        public override bool RequiresQuestionAndAnswer
        {
            get { return false; }
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password,
                                                             string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotSupportedException("Consider using methods from WebSecurity module.");
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotSupportedException("Consider using methods from WebSecurity module.");
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotSupportedException("Consider using methods from WebSecurity module.");
        }

        //CodeFirstMembershipProvider does not support UpdateUser because this method is useless.
        public override void UpdateUser(MembershipUser user)
        {
            throw new NotSupportedException();
        }

        #endregion Not Supported
    }
}