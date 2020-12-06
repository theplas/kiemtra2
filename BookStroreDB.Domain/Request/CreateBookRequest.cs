﻿using System;
using System.Collections.Generic;
using System.Text;

namespace BookStroreDB.Domain.Request
{
    public class CreateBookRequest
    {
        public string BookName { get; set; }
        public string Author { get; set; }
        public string BookRow { get; set; }
    }
}
