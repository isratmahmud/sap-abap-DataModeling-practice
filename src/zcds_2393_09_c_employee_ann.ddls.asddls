@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Consumption)'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZCDS_2393_09_C_EMPLOYEE_ANN as select from ZCDS_2393_08_R_EMPLOYEE_ANN
{
    key Employeeid,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
//    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
