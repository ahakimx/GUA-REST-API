json.policies @current_user.policies do |user|
  json.agent user.agents.name
  json.insurance_category user.insurance_category.name
  json.policy_id user.policy_id
  json.premium user.premium
  json.insurance_due_date user.insurance_due_date
  json.policy user.policy
  json.register_date user.register_date
  json.premium_date user.premium_date
  json.guarantee_number user.guarantee_number
end
