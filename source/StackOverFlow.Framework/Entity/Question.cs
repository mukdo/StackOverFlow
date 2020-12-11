using NHibernate.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StackOverFlow.Framework.Entity
{
    public class Question : IEntity<int>
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime DateTime { get; set; }
        public string UserId { get; set; }
        public string AnswareId { get; set; }
        public ICollection<Answare> Answares { get; set; }
        public IdentityUser Identityuser { get; set; }

    }
}
