class Audit < Audited.audit_class

  # --- CSV Generation

  comma do
    id
    version
    created_at
    auditable_id
    auditable_type
    auditable identity: 'Auditable name'
    action
    user_id
    user name: 'User name'
    audited_changes
  end
end
