@AbapCatalog: 
{ dataMaintenance: #RESTRICTED, 
viewEnhancementCategory: [#PROJECTION_LIST], 
extensibility.dataSources: [ 'Employee' ],
extensibility.elementSuffix: 'ZZI'}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds of emp table'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_19_R_EMPLOYEE_4X as select from zdt_2393_18_e_ex as Employee
{
    key employeeid as Employeeid,
    first_name as FirstName,
    last_name as LastName,
    birth_date as BirthDate,
    entry_date as EntryDate,
    department_id as DepartmentId,
//    annual_salary as AnnualSalary,
//    currency_code as CurrencyCode,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}
