@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_13_C_EMP_EXP as select from ZCDS_2393_11_R_EMPREL
{
    key Employeeid,
    FirstName,
    LastName,
//    BirthDate,
//    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    // it is a path expression
    _dept.Description as DeptDesc,
    _dept._assistant.LastName as AssistantLastName,
     
//    CreatedBy,
//    CreatedAt,
//    LocalLastChangedBy,
//    LocalLastChangedAt,
//    LastChangedAt,
    @EndUserText.label: 'Employee Role' 
    case Employeeid 
    when _dept.DeptHead then 'H' 
    when _dept.DeptAssistant then 'A' 
    else ' ' end as EmployeeRole,
    @EndUserText.label: 'Monthly Salary' 
    cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalary,
    
    /* Associations */
    
    _dept
}
