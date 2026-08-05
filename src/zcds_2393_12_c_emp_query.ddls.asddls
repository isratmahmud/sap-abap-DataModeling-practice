@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_12_C_EMP_QUERY as select from ZCDS_2393_11_R_EMPREL
{
    key Employeeid,
    FirstName,
    LastName,
//    BirthDate,
//    EntryDate,
    DepartmentId,
    // it is a path expression
    _dept.Description as DeptDesc,
    _dept._assistant.LastName as AssistantLastName,
//    CreatedBy,
//    CreatedAt,
//    LocalLastChangedBy,
//    LocalLastChangedAt,
//    LastChangedAt,
    /* Associations */
    _dept
}
