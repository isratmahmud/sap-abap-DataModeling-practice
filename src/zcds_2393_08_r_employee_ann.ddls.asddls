
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View'
@Metadata.ignorePropagatedAnnotations: true
//@AbapCatalog.dataMaintenance: #RESTRICTED
//@AbapCatalog.viewEnhancementCategory: [#NONE]

@AbapCatalog: {
    dataMaintenance: #RESTRICTED,
    viewEnhancementCategory: [#NONE]
}
define view entity ZCDS_2393_08_R_EMPLOYEE_ANN as select from zdt_2393_03_emp
{
    key employeeid as Employeeid,
    first_name as FirstName,
    last_name as LastName,
    birth_date as BirthDate,
    entry_date as EntryDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    annual_salary as AnnualSalary,
    @EndUserText.label: 'Currency Key'
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}
