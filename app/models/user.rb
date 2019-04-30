class User < ApplicationRecord
  audited

  comma do
    id
    name
    email

    # auditable_id
    # auditable_type
    # auditable identity: 'Auditable name'
    # audited_changes
    audits
  end
end
