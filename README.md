# Department Master - .NET Core MVC Application

## Overview
This is a complete .NET Core MVC implementation of a Department Master module for the E-Management application. It provides full CRUD operations, advanced searching, pagination, filtering, and export functionality.

## Features Implemented

### 1. Department Master CRUD Operations
- **Create**: Add new departments with validation
- **Read**: View department details with pagination
- **Update**: Edit existing department information
- **Delete**: Soft delete departments (mark as inactive)

### 2. Advanced Search & Filter
- Global search across all columns
- Column-level search filters
- Real-time search results
- Multiple filter combinations

### 3. Pagination
- Customizable page sizes (5, 10, 25, 50, 100 records)
- Display total record count
- Previous/Next/First/Last navigation
- Page number indicator

### 4. Sorting
- Sort by any column
- Ascending and descending order
- Visual indicator for current sort column

### 5. Export Functionality
- Export to CSV format
- Export to Excel format (requires EPPlus)
- Export to PDF (requires iTextSharp)
- Print option

### 6. UI Features
- Display logged-in Employee Number and Name
- Responsive Bootstrap design
- Modal form for Create/Edit operations
- Real-time validation
- Success/error message alerts
- Easy navigation

### 7. Data Validation
- Prevent duplicate department codes
- All fields are mandatory
- Client-side and server-side validation
- User-friendly error messages

## Project Structure

```
DepartmentMaster/
├── Models/
│   ├── Department.cs                 # Department entity
│   └── DepartmentViewModel.cs         # View models
├── Services/
│   ├── IDepartmentService.cs          # Service interface
│   └── DepartmentService.cs           # Service implementation
├── Data/
│   └── ApplicationDbContext.cs        # Entity Framework context
├── Controllers/
│   └── DepartmentController.cs        # CRUD controller
├── Views/
│   └── Department/
│       ├── Index.cshtml               # List view
│       └── _DepartmentForm.cshtml     # Form partial
├── Database/
│   └── SQL_Scripts.sql                # SQL scripts
├── appsettings.json                   # Configuration
└── Program.cs                         # Startup configuration
```

## Database Setup

### Prerequisites
- SQL Server 2016 or later
- .NET 6.0 SDK or later

### Steps to Setup

1. **Create Database**
   ```sql
   CREATE DATABASE hrmis;
   ```

2. **Run SQL Scripts**
   - Open `Database/SQL_Scripts.sql`
   - Execute all scripts in SQL Server Management Studio
   - This will create:
     - Department table
     - Stored procedures for CRUD operations
     - Indexes for performance
     - Sample data

3. **Update Connection String**
   - Edit `appsettings.json`
   - Update `DefaultConnection` with your server details:
   ```json
   "ConnectionStrings": {
       "DefaultConnection": "Data Source=YOUR_SERVER;Initial Catalog=hrmis;User Id=sa;Password=your_password;Encrypt=false;TrustServerCertificate=true;Connection Timeout=30;"
   }
   ```

## Installation & Setup

### 1. Install Dependencies
```bash
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.AspNetCore.Authentication.Cookies
```

### 2. Apply Entity Framework Migrations
```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### 3. Run the Application
```bash
dotnet run
```

### 4. Access the Application
- Navigate to: `https://localhost:5001/Department/Index`
- Login with employee credentials
- Access Department Master from the menu

## Usage Guide

### Creating a Department
1. Click "Add New Department" button
2. Fill in all required fields:
   - Department Code (unique)
   - Department Name
   - Got Japanese Head (Yes/No)
   - Direct/Indirect Dept (Direct/Indirect)
   - Got Section (Yes/No)
   - General Abbreviation
3. Click "Save" button
4. Record will appear in the grid immediately

### Editing a Department
1. Click "Edit" button on any record
2. Modify required fields
3. Click "Save" button
4. Changes will be reflected in the grid

### Deleting a Department
1. Click "Delete" button on any record
2. Confirm deletion in the alert
3. Record will be marked as inactive (soft delete)

### Searching & Filtering
1. Enter search criteria in filter fields:
   - Department Code
   - Department Name
   - Japan Head (dropdown)
   - Office Type (dropdown)
   - Section (dropdown)
   - Abbreviation
2. Click "Search" button
3. Results will be filtered in real-time
4. Click "Reset" to clear filters

### Sorting
1. Click on column headers to sort
2. Click again to toggle ascending/descending order
3. Arrow indicator shows current sort direction

### Exporting Data
- **CSV Export**: Click "Export CSV" button
- **Excel Export**: Click "Export Excel" button
- **Print**: Click "Print" button (opens print dialog)

### Pagination
1. Use pagination controls at bottom of grid
2. Select specific page number
3. Use "First", "Previous", "Next", "Last" buttons
4. Current page is highlighted

## API Endpoints

### Department Controller Routes

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/Department/Index` | Get all departments with pagination |
| GET | `/Department/Create` | Get create form |
| POST | `/Department/Create` | Create new department |
| GET | `/Department/Edit/{id}` | Get edit form |
| POST | `/Department/Edit` | Update department |
| GET | `/Department/Delete/{id}` | Delete department |
| POST | `/Department/ExportCsv` | Export to CSV |
| POST | `/Department/ExportExcel` | Export to Excel |
| POST | `/Department/Print` | Get print view |
| GET | `/Department/GetDepartments` | Get departments (AJAX) |

## Entity Framework Model

### Department Properties

| Property | Type | Description |
|----------|------|-------------|
| RecordNo | int | Primary key (auto-increment) |
| DepartmentCode | string | Unique department code (required) |
| DepartmentName | string | Department name (required) |
| JapanHead | string | Y/N flag for Japanese head |
| Office | string | P (Direct) or O (Indirect) |
| Section | string | Y/N flag for having sections |
| Prefix | string | Department abbreviation |
| CreatedBy | string | User who created record |
| CreatedOn | DateTime | Creation date/time |
| EditedBy | string | User who last edited record |
| EditedOn | DateTime | Last edit date/time |
| IsActive | bool | Active/inactive status |

## Configuration

### appsettings.json
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Data Source=YOUR_SERVER;Initial Catalog=hrmis;..."
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information"
    }
  }
}
```

## Security Features

- **Authentication**: Cookie-based authentication required
- **Authorization**: Login required for all operations
- **CSRF Protection**: Anti-forgery tokens on all forms
- **Input Validation**: Client-side and server-side validation
- **SQL Injection Prevention**: Parameterized queries and Entity Framework
- **XSS Prevention**: Model validation and HTML encoding

## Error Handling

- Try-catch blocks in all service methods
- User-friendly error messages
- Logging of all errors
- Graceful error pages
- Validation error display in forms

## Performance Optimization

- **Indexes**: Created on:
  - departmentcode
  - departmentname
  - isactive
- **Pagination**: Limits records retrieved per page
- **Soft Delete**: Queries filter inactive records
- **Connection Pooling**: Configured in connection string
- **Asynchronous Operations**: Async/await throughout

## Stored Procedures

1. `mis_insdepartment_NEW` - Insert new department
2. `MIS_UPDdepartment_NEW` - Update department
3. `get_all_departments` - Get all departments with pagination
4. `search_departments` - Search departments
5. `filter_departments` - Filter departments by criteria
6. `check_department_exists` - Check duplicate code
7. `get_department_by_id` - Get single department
8. `soft_delete_department` - Soft delete department

## Testing

### Manual Testing Checklist
- [ ] Create new department
- [ ] Edit existing department
- [ ] Delete department
- [ ] Search by code
- [ ] Filter by multiple criteria
- [ ] Sort by columns
- [ ] Paginate through results
- [ ] Export to CSV
- [ ] Validate duplicate code prevention
- [ ] Test all form validations
- [ ] Check responsive design
- [ ] Verify error handling

### Unit Testing
```bash
dotnet test
```

## Troubleshooting

### Connection String Issues
- Verify SQL Server is running
- Check server name and port
- Confirm database exists
- Test credentials

### Entity Framework Issues
- Clear bin/obj folders
- Run `dotnet clean`
- Rebuild solution
- Check connection string

### Authentication Issues
- Verify login controller exists
- Check session configuration
- Confirm cookies enabled

### Export Issues
- For Excel: Install EPPlus package
- For PDF: Install iTextSharp package
- Check file permissions

## Future Enhancements

1. **Bulk Operations**
   - Bulk import from Excel
   - Bulk delete multiple records

2. **Audit Trail**
   - Log all changes
   - Track user actions

3. **Advanced Reporting**
   - Custom report builder
   - Scheduled reports

4. **API Integration**
   - RESTful API
   - Mobile app support

5. **Performance**
   - Caching
   - Query optimization
   - Pagination optimization

## Support & Documentation

For issues or questions:
1. Check the troubleshooting section
2. Review error logs
3. Check SQL Server logs
4. Contact development team

## Version History

- **v1.0** (Initial Release)
  - CRUD operations
  - Search and filter
  - Pagination and sorting
  - Export functionality
  - Responsive UI
  - Stored procedures integration

## License
This project is part of the E-Management system.

## Contributors
- Development Team
- Database Team
- QA Team
