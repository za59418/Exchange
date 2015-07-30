using System;
using System.Collections.Generic;
using System.Text;

namespace ZXL.Exchange.Service.Point
{
    class PointVO
    { 
        public int PointID{get;set;}
		public string PointName{get;set;}
        public string PointAddress { get; set; }
        public string ContactPerson { get; set; }
        public string Tel { get; set; }
    }
}
