select toStartOfHour(dt_operation) dt_hour
     , count() cnt
     , uniq(shk_id) uniq_shk
     , uniq(new_shk_id) uniq_new_shk
     , countIf(new_shk_id, new_shk_id=0) count_new_shk_0
     , countIf(new_shk_id, new_shk_id!=0) count_new_shk_not_0
     , uniq(chrt_id) uniq_chrt
     , countIf(chrt_id, chrt_id < 1) cnt_chrt_0
     , countIf(dt_lost='2000-01-01 00:00:00.00') cnt_dt_lost_0
     , uniq(create_employee_id) uniq_create_employee
     , countIf(create_employee_id, create_employee_id < 1) cnt_0_create_employee
     , uniq(lostreason_id) uniq_lostreason
     , countIf(lostreason_id, operation_code = 'shkwriteoff') cnt_shkwriteoff
     , countIf(lostreason_id, operation_code = 'shkfound') cnt_shkfound
     , countIf(lostreason_id, operation_code = '') cnt_oper_code_0
from default.shk_lost_2
group by dt_hour
