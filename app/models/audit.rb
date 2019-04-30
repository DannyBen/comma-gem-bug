class Audit < Audited.audit_class
  comma do
    id
    version
    created_at
    auditable_id
    auditable_type
    action
    user_id
    audited_changes

    # These lines are the ones causing the error
    # - Without them, the CSV generation works
    # - With them, and with comma 4.2.0, the CSV generation works
    auditable identity: 'Auditable name'
    user name: 'User name'
  end
end
