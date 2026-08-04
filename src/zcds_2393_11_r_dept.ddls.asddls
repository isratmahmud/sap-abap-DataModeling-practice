@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds of dept table'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_2393_11_R_DEPT
  as select from zdt_2393_10_dept
  association [0..*] to ZCDS_2393_07_R_Employee as _emp on $projection.Id = _emp.DepartmentId
  association [0..1] to ZCDS_2393_07_R_Employee as _head on $projection.DeptHead = _head.Employeeid
  association [1..1] to ZCDS_2393_07_R_Employee as _assistant on $projection.DeptAssistant = _assistant.Employeeid
{
  key id                    as Id,
      description           as Description,
      dept_head             as DeptHead,
      dept_assistant        as DeptAssistant,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _emp, _head, _assistant
}
