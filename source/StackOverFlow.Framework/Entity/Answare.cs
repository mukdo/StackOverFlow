using NHibernate.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StackOverFlow.Framework.Entity
{
    public class Answare : IEntity<int>
    {
        public int Id { get; set; }
        public string Answer { get; set; }
        public DateTime Datetime { get; set; }
        public string UserId { get; set; }
        public bool IsAccepted { get; set; }
        public int QuestionId { get; set; }
        public Question Question { get; set; }
        public IdentityUser  Identityuser { get; set; }
    }
}
