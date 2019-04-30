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

    # This lines is the one causing the error
    # - Without it, the CSV generation works
    # - With it, and with comma 4.2.0, the CSV generation works
    auditable name: 'Auditable name'
  end
end
