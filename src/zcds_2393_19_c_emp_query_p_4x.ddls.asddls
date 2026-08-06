@AbapCatalog: 
{ dataMaintenance: #RESTRICTED, 
viewEnhancementCategory: [#PROJECTION_LIST], 
extensibility.dataSources: [ 'Employee' ], 
extensibility.elementSuffix: 'ZZI'}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_19_C_EMP_QUERY_P_4X
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats

  as select from zdt_2393_18_e_ex as Employee
{
  key employeeid,
      first_name,
      last_name,
      //    BirthDate,
      //    EntryDate,
      department_id,
      @Semantics.amount.currencyCode: 'currency_code'
      annual_salary,
      currency_code,
//      cast( 'USD' as /dmo/currency_code )                                        as CurrencyCodeUSD,
      $parameters.p_target_curr as CurrencyCodeUSD,
      
//       _dept._assistant.LastName as AssistantLastName,
      @EndUserText.label: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'

      currency_conversion(
      amount => annual_salary,
      source_currency => currency_code ,
      target_currency => $projection.CurrencyCodeUSD,
      exchange_rate_date => $parameters.p_date)                                as AnnualSalaryConverted,

      //************* it is a path expression
//      _dept.Description                                                          as DeptDesc,
      //    _dept._assistant.LastName as AssistantLastName,
//      concat_with_space(_dept._assistant.FirstName,_dept._assistant.LastName, 1) as AssitantName,
//      division(dats_days_between(EntryDate, $session.system_date),365,1)         as CompanyAffiliation,
         division(dats_days_between(entry_date,$parameters.p_date),365,1)         as CompanyAffiliation,
      //    CreatedBy,
      //    CreatedAt,
      //    LocalLastChangedBy,
      //    LocalLastChangedAt,
      //    LastChangedAt,
//      @EndUserText.label: 'Employee Role'
//      case Employeeid
//      when _dept.DeptHead then 'H'
//      when _dept.DeptAssistant then 'A'
//      else ' ' end                                                               as EmployeeRole,
      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'currency_code'
      cast( annual_salary as abap.fltp ) / 12.0                                   as MonthlySalary,
      cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0              as MonthlySalaryConverted

      /* Associations */

//      _dept
}
