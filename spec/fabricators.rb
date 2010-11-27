Fabricator(:bill) do ||
  description "Description"
  payable_to "Payable To"
  amount 100
  due_date Date.today
end

Fabricator(:user) do
  email "test@example.net"
  password "123456"
  bills!(:count => 20) { |user, i| Fabricate(:bill, :user => user, :description => "Drone #{i}", :amount => (i*101)) }
end

