extend view entity ZCDS_2393_19_C_EMP_QUERY_P_4X with 
association [1..1] to I_Country as _ZZCountryZem on $projection.ZzcountryZZZ = _ZZCountryZem.Country
{
    Employee.zztitle_zzi as ZztitleZZZ,
    Employee.zzcountry_zzi as ZzcountryZZZ,
    concat_with_space( Employee.first_name, Employee.last_name, 1 ) as zzfull_name_zzi,
    _ZZCountryZem.IsEuropeanUnionMember as ZZEUBasedZem
}
