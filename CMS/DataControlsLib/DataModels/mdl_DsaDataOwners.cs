﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataControlsLib.DataModels
{
    public class mdl_DsaDataOwners
    {
        public int doID { get; set; }
        public string DateOwnerName { get; set; }
        public int? RebrandOf { get; set; }
        public string DataOwnerEmail { get; set; }
    }
}
