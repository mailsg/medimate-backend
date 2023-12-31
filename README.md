<div align="center">
  <!-- You are encouraged to replace this logo with your own! Otherwise you can also remove it. -->
  <img src="logo.jpg" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>MediMate</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [Kanban Board](#kanban-board)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# MediMate <a name="about-project"></a>

**MediMate** is an app to book an appointment with a doctor. It is built as a two part app. This is the backend part of the app. The front end part of this app can be found [here](https://github.com/mailsg/medimate-frontend). The team members of this project are
- **Charles Andrews**
- **Emmanuel Tofa**
- **Sandeep Ghosh**

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://react.dev/">React</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **API Endpoints to login a user**
- **API Endpoints to book appointments**
- **API deployment**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Backend Link](https://medimate-backend-p22y.onrender.com)
- [API Documentation](https://medimate-backend-p22y.onrender.com/api-docs)

## Kanban Board <a name="kanban-board"></a>

- [Link to the project kanban board](https://github.com/users/mailsg/projects/7)


- ![Merged_document](https://github.com/mailsg/medimate-backend/assets/105475440/533bacc1-6805-4b99-8685-229e0f3c97ab)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

```sh
 gem install rails
```

### Setup

Clone this repository to your desired folder:

```sh  
  git clone git@github.com:mailsg/medimate-backend.git
  cd medimate-backend  
```

### Install

Install this project by executing the following commands. Since its an Open API, there is no need to set up any API keys:

```sh
  cd medimate-backend

  bundle install

  touch .env
    `Add the following lines to the .env file`
      DB_USERNAME=`Your PostgreSQL username`
      DB_PASSWORD=`Your PostgreSQL password`

  To generate keys when master.key file is missing in the repo:
  
    1. Remove config/master.key and config/credentials.yml.enc if they exist.
    2. Run in the terminal: EDITOR=code rails credentials:edit 
    3. Close the editor that opens.
    4. This command will create a new master.key and credentials.yml.enc if they do not exist.
    5. Run the commands below to create the database
  
    rails db:create
    rails db:migrate
    rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Charles Andrews**

- GitHub: [@forloop94](https://github.com/forloop94)
- LinkedIn: [LinkedIn](https://linkedin.com/in/andrewsCharlesUwem)

👤 **Emmanuel Tofa**

- GitHub: [@uno36](https://github.com/uno36)
- LinkedIn: [LinkedIn](https://linkedin.com/in/emmanuel-tofa-673b2516a)

👤 **Sandeep Ghosh**

- GitHub: [@mailsg](https://github.com/mailsg)
- LinkedIn: [LinkedIn](https://linkedin.com/in/sandeep0912)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **Booking Fee Payment**
- **Medical Records Storage**
- **Online Consultations**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project consider leaving a star to the repository.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

We would like to thank **Microverse** for giving us this opportunity to showcase our skills as a full stack developer. We would also like to thank **Murat Korkmaz** for providing the wonderful design of the app on **Behance**. Last but not the least a big thanks to the **Open Source** ecosystem for providing free to use resources without which the project would not have taken the shape. Thank you all.   

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
