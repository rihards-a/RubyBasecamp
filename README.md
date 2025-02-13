# MyBasecamp1 🚀  

A **Basecamp-inspired** project management tool built with **Ruby on Rails 8.0.1**.  
Users can **register, log in, create projects, manage roles, and collaborate** seamlessly.  

## 🛠️ Tech Stack  
- **Ruby**: 3.3.5  
- **Rails**: 8.0.1  
- **Database**: SQLite3 (default, configurable)  
- **Front-end**: StimulusJS & Bootstrap (optional)  
- **Testing**: Minitest / Capybara  

## 🚀 Getting Started  

### 1️⃣ Prerequisites  
Ensure you have the following installed:  
- **Ruby 3.3.5** → Check with `ruby -v`  
- **Rails 8.0.1** → Check with `rails -v`  
- **Bundler** (Install if missing: `gem install bundler`)  
- **SQLite3** (Pre-installed with Rails, but confirm via `rails db:version`)  

### 2️⃣ Installation Steps  

#### 🔹 Clone the Repository  
git clone https://github.com/YOUR_USERNAME/MyBasecamp1.git
cd MyBasecamp1
#### 🔹 Install Dependencies
bundle install
#### 🔹 Set Up the Database
rails db:create
rails db:migrate
#### 🔹 Start the Rails Server
rails server

### 🔑 Admin Access

#### To create an Admin User, run the following command in the Rails console:

rails console

#### Then, execute:

User.create!(
  email: "admin@example.com",
  password: "securepassword",
  password_confirmation: "securepassword",
  is_admin: true
)

#### Use this email & password to log in as an Admin.

