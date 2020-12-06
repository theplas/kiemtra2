using System;
using System.Collections.Generic;
using System.Text;

namespace BookStroreDB.Domain.Reponse
{
    public class ShowBookResult
    {
        public int BookId { get; set; }
        public string BookName { get; set; }
        public string Author { get; set; }
        public string BookRow { get; set; }
        public string Message { get; set; }
    }
}
