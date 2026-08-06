@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Dept Query'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_16_C_DEPT_QUERY
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
  as select from     ZCDS_2393_15_C_EMP_QUERY_P (
                     p_target_curr: $parameters.p_target_curr,
                     p_date: $parameters.p_date) as e
    right outer join ZCDS_2393_11_R_DEPT         as d on d.Id = e.DepartmentId

{
  d.Id,
  d.Description,
  avg( e.CompanyAffiliation as abap.dec(11,1)) as AverageAffiliation,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( e.AnnualSalaryConverted )               as TotalSalary,
  e.CurrencyCodeUSD                            as CurrencyCode
}
group by
  d.Id,
  d.Description,
  e.CurrencyCodeUSD
