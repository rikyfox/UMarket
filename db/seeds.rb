User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             role: "admin")

User.create!(name:  "Buyer1",
        email: "buyer1@buyer.com",
        password:              "123456",
        password_confirmation: "123456",
        role: "buyer")

        User.create!(name:  "Vendor1",
                email: "vendor1@vendor.com",
                password:              "123456",
                password_confirmation: "123456",
                role: "vendor")
