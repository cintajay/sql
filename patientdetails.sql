select patients.user_id as patient_user_id, patients.id as patient_id,
treatments.doctor_user_id, treatments.doctor_practice_information_id as practice_id,
dpi.dso_id, dso.name as dso_name, dpi.practice_name,
concat(doc_addr.first_name,' ',doc_addr.middle_name,' ',doc_addr.last_name) as doctor_name, doc_addr.email as doctor_email,
concat(doc_addr.street1,',',doc_addr.street2,',',doc_addr.city,',',doc_addr.country,',',doc_addr.zipcode) as doctor_address,
concat(pat_addr.first_name,' ',pat_addr.middle_name,' ',pat_addr.last_name) as patient_name, pat_addr.email as patient_email,
concat(pat_addr.street1,',',pat_addr.street2,',',pat_addr.city,',',pat_addr.country,',',pat_addr.zipcode) as patient_primary_address
from patients
inner join users on users.id=patients.user_id
left join treatments on treatments.patient_id=patients.id
-- left join doctor_practice_map dpm on dpm.practice_id=doctor_practice_information_id
left join doctor_profiles pro on pro.practice_id=treatments.doctor_practice_information_id
-- left join doctor_practice_informations dpi on dpi.primary_doctor_id=dpm.doctor_profile_id
left join doctor_practice_informations dpi on dpi.primary_doctor_id=treatments.doctor_practice_information_id
left join dso on dso.id=dpi.dso_id
left join address_book doc_addr on doc_addr.user_id=treatments.doctor_user_id 
left join address_book pat_addr on pat_addr.user_id=patients.user_id
where pat_addr.type='PRIMARY' 
order by patients.id 




