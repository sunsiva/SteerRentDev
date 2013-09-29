using Common.Services;
using System;
using uNext.Services.Contracts;

namespace uNext.Membership
{
    public class RoleProvider : System.Web.Security.RoleProvider, IDisposable
    {
        private readonly IClientFactory<IInfrastructure> serviceClient = new ClientFactory<IInfrastructure>();

        public RoleProvider()
        {
        }

        public override string ApplicationName
        {
            get
            {
                return GetType().Assembly.GetName().Name;
            }
            set
            {
                if (value == null) throw new ArgumentNullException("value");
                ApplicationName = GetType().Assembly.GetName().Name;
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            serviceClient.Client.AddUsersToRoles(usernames, roleNames);
        }

        public override void CreateRole(string roleName)
        {
            if (!string.IsNullOrEmpty(roleName))
            {
                serviceClient.Client.CreateRole(roleName);
            }
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return false;
            }
            return false;
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return null;
            }

            return string.IsNullOrEmpty(usernameToMatch) ? null : serviceClient.Client.FindUsersInRole(roleName, usernameToMatch);
        }

        public override string[] GetAllRoles()
        {
            return serviceClient.Client.GetAllRoles();
        }

        public override string[] GetRolesForUser(string username)
        {
            return string.IsNullOrEmpty(username) ? null : serviceClient.Client.GetRolesForUser(username);
        }

        public override string[] GetUsersInRole(string roleName)
        {
            return string.IsNullOrEmpty(roleName) ? null : serviceClient.Client.GetUsersInRole(roleName);
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            if (string.IsNullOrEmpty(username))
            {
                return false;
            }
            return !string.IsNullOrEmpty(roleName) && serviceClient.Client.IsUserInRole(username, roleName);
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            serviceClient.Client.RemoveUsersFromRoles(usernames, roleNames);
        }

        public override bool RoleExists(string roleName)
        {
            return !string.IsNullOrEmpty(roleName) && serviceClient.Client.DoesRoleExist(roleName);
        }

        #region IDisposable

        ~RoleProvider()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposing) return;

            if (serviceClient != null)
                serviceClient.Dispose();
        }

        #endregion IDisposable
    }
}