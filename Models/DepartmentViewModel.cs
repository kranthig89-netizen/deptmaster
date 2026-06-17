using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DepartmentMaster.Models
{
    public class DepartmentViewModel
    {
        public Department Department { get; set; }

        // Pagination Properties
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public int TotalRecords { get; set; }
        public int TotalPages => (TotalRecords + PageSize - 1) / PageSize;

        // Search Properties
        public string SearchTerm { get; set; }
        public string SortColumn { get; set; } = "DepartmentCode";
        public string SortDirection { get; set; } = "ASC";

        // Column Search Properties
        public string SearchDepartmentCode { get; set; }
        public string SearchDepartmentName { get; set; }
        public string SearchJapanHead { get; set; }
        public string SearchOffice { get; set; }
        public string SearchSection { get; set; }
        public string SearchPrefix { get; set; }

        // Grid Data
        public List<Department> Departments { get; set; } = new List<Department>();

        // User Info
        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
    }

    public class DepartmentListViewModel
    {
        public List<Department> Departments { get; set; } = new List<Department>();
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public int TotalRecords { get; set; }
        public int TotalPages => (TotalRecords + PageSize - 1) / PageSize;
        public string SearchTerm { get; set; }
        public string SortColumn { get; set; } = "DepartmentCode";
        public string SortDirection { get; set; } = "ASC";

        // Column Searches
        public string SearchDepartmentCode { get; set; }
        public string SearchDepartmentName { get; set; }
        public string SearchJapanHead { get; set; }
        public string SearchOffice { get; set; }
        public string SearchSection { get; set; }
        public string SearchPrefix { get; set; }

        public string EmployeeCode { get; set; }
        public string EmployeeName { get; set; }
    }
}
