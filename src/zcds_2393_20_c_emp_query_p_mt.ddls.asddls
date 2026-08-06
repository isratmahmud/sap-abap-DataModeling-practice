@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCDS_2393_20_C_EMP_QUERY_P_MT
  with parameters
    p_target_curr : /dmo/currency_code,
    
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats

  as select from ZCDS_2393_11_R_EMPREL
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
//      cast( 'USD' as /dmo/currency_code )                                        as CurrencyCodeUSD,
      $parameters.p_target_curr as CurrencyCodeUSD,
      
       _dept._assistant.LastName as AssistantLastName,
      
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'

      currency_conversion(
      amount => AnnualSalary,
      source_currency => CurrencyCode ,
      target_currency => $projection.CurrencyCodeUSD,
      exchange_rate_date => $parameters.p_date)                                as AnnualSalaryConverted,

      //************* it is a path expression
      _dept.Description                                                          as DeptDesc,
      //    _dept._assistant.LastName as AssistantLastName,
      concat_with_space(_dept._assistant.FirstName,_dept._assistant.LastName, 1) as AssitantName,
//      division(dats_days_between(EntryDate, $session.system_date),365,1)         as CompanyAffiliation,
         division(dats_days_between(EntryDate,$parameters.p_date),365,1)         as CompanyAffiliation,
      //    CreatedBy,
      //    CreatedAt,
      //    LocalLastChangedBy,
      //    LocalLastChangedAt,
      //    LastChangedAt,
      
      case Employeeid
      when _dept.DeptHead then 'H'
      when _dept.DeptAssistant then 'A'
      else ' ' end                                                               as EmployeeRole,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( AnnualSalary as abap.fltp ) / 12.0                                   as MonthlySalary,
      cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0              as MonthlySalaryConverted,

      /* Associations */

      _dept
}
