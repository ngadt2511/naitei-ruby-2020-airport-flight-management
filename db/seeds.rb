User.create!(name: "test",
  email: "test1@gmail.com",
  password: "12345678",
  password_confirmation: "12345678"
  )
# create admin account
User.create!(name: "Admin",
  email: "admin@gmail.com",
  staff_code: "N12A-1211",
  type_account: 0,
  unit: "A12BAG12",
  password: "123456"
  )
# create phi cong pilot
5.times do |n|
  name = "PiLot#{n+1}"
  email = "pilot#{n+1}@gmail.com"
  password = "123456"
  staff_code = "N12A-#{n+1}"
  type_account = 2
  unit = "A12BHG #{n+1}"
  User.create!(name: name,
               email: email,
               staff_code: staff_code,
               type_account: type_account,
               unit: unit,
               password: password
               )
end
# create nhan vien khong luu
5.times do |n|
  name = "Air Traffic Officer#{n+1}"
  email = "ATO#{n+1}@gmail.com"
  password = "123456"
  staff_code = "ATO20_#{n+1}"
  type_account = 1
  unit = "A12BHG #{n+1}A"
  User.create!(name: name,
               email: email,
               staff_code: staff_code,
               type_account: type_account,
               unit: unit,
               password: password
               )
end
# create  may bay

10.times do |n|
  if n % 2
    name = "VN-2020#{n+2}"
    braned = "vietname airline"
  else
    name = "VJ-2020#{n+2}"
    braned = " Viet Ject"
  end
  status = "0"
  Plane.create!(name: name,
               status: status,
               braned: braned
               )
end
# create runway

2.times do |n|
  name = " Runway#{n+1}"
  status = "0"
  Runway.create!(name: name,
               status: status
               )
end
# create schedule
def rand_time(from, to=Time.now + 6.days)
  Time.at(from + rand * (to.to_f - from.to_f))
end

40.times do |n|
  time = rand_time(2.days.ago).strftime("%Y-%m-%d %H:%M")
  status = "0"
  title = "hi every one!"
  from = "#{n%2 + 1}"
  to = "#{n%2 +2}"
  runway_id = n%2 +1
  plane_id = (n*131 + n*11) % 10 +1
  user_id = (n*249 + n*17 +n *3)%5 +4
  Schedule.create!(time: time,
                  status: status,
                  title: title,
                  from: from,
                  to: to,
                  runway_id: runway_id,
                  plane_id: plane_id,
                  user_id: user_id
    )
end
# create  notification
20.times do |n|
  title = "Vietnam ariline"
  content = "Delay plane"
  status = "0"
  schedule_id = (n*131 + n*11) % 20+1
  Notification.create!(title: title,
                  content: content,
                  status: status,
                  schedule_id: schedule_id
    )
end
