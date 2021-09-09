# ![icons8-safety-care-25](https://user-images.githubusercontent.com/78288118/132427946-8b75ba2b-96b0-45b5-aeb6-fa0af4762e52.png) Justice


Evidence-collecting app for victims of abuse. Document incidents, create police reports in Japanese, connect with other users who have the same abuser.



![Homescreen](https://user-images.githubusercontent.com/78288118/132426048-3ce4691c-620f-4a11-b714-9b9fdb0681bc.jpg) ![241631834_604907540681684_1019720436111268722_n](https://user-images.githubusercontent.com/78288118/132426258-9ed8b986-6caf-429a-843a-1a52e10d4ab3.jpg) ![241573006_1219255375221317_3097282583302976208_n](https://user-images.githubusercontent.com/78288118/132426496-0502caf4-8ad9-4e20-b75a-1096402b294a.jpg) ![241632540_892793827986829_2787164339891048150_n](https://user-images.githubusercontent.com/78288118/132426347-4441c613-196f-4321-bfb2-f962f1176f8b.jpg)


<br>
App home: https://www.wearejustice.life/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
API_KEY=your_own_api_key
GMAIL_ADDRESS=team_email_address
GMAIL_APP_PASSWORD=team_app_password
ACTION_MAILER_HOST_URL=host_url
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by victims of abuse who have lacked the resources to hold their abusers accountable.

## Team Members
- [Nomin Batsaikhan](https://www.linkedin.com/in/nmnbatsaikhan/)
- [Sasha Kaverina](https://www.linkedin.com/in/sasha-kaverina/)
- [Shogo Miyagi](https://www.linkedin.com/in/shogo-miyagi/)
- [Aidan Fournier](https://www.linkedin.com/in/aidanfournier/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

