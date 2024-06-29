# Organizational Grievance Support System

Welcome to the Organizational Grievance Support System (OGSS). This system is designed to streamline the process of reporting, reviewing, and addressing grievances within an organization. The project is organized into three main branches: frontend, backend, and .apk file.

## Table of Contents
- [Linke](#links)
- [Branches](#branches)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Links
    Admin side web video link - https://drive.google.com/file/d/1Z7D-vZPQhmJs7NyqHbE8rN0sMLrSjLDE/view
    Admin side web frontend hosted link - https://japanshah17.github.io/odoo-combat/
    Employee flutter apk video link - https://drive.google.com/file/d/1oaMjpde1p7k1UOPSPcMpFIa0D_KirtjE/view?usp=sharing
    Employee flutter apk - https://drive.google.com/file/d/1iBtCO7Ahw1iS4rHaYRYtZ32vQftfOtrG/view?usp=sharing
    Fastapi hosted link - https://grievancebackend.onrender.com/docs 
## Branches

### 1. Frontend
- **Location:** `frontend` branch
- **Description:** Contains the code for the web dashboard where admins can view and manage grievance reports.
- **Technologies:** HTML, CSS, JavaScript

### 2. Backend
- **Location:** `backend` branch
- **Description:** Handles the server-side logic, API endpoints, and database interactions.
- **Technologies:** FastAPI, Django

### 3. APK File
- **Location:** `apk` branch
- **Description:** Mobile application for employees to report grievances. 
- **Technologies:** Flutter

## Technologies Used
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** FastAPI, Django
- **Mobile App:** Flutter

## Installation

### Frontend
1. Clone the frontend branch:
    ```bash
    git clone -b frontend <repository_url>
    ```
2. Navigate to the project directory and open `index.html` in a web browser.

### Backend
1. Clone the backend branch:
    ```bash
    git clone -b backend <repository_url>
    ```
2. Navigate to the project directory.
3. Install the required Python packages:
    ```bash
    pip install -r requirements.txt
    ```
4. Run the backend server:
    ```bash
    uvicorn main:app --reload
    ```

### APK File
1. Clone the apk branch:
    ```bash
    git clone -b apk <repository_url>
    ```
2. Open the project in your preferred Flutter development environment.
3. Build and run the application on an emulator or physical device.

## Usage

### Web Dashboard (Frontend)
- Open the `index.html` file in a web browser.
- Admins can log in to view, review, and manage grievance reports submitted by employees.

### Mobile App (APK)
- Employees download and install the app on their phones.
- Use the app to report grievances, which will be sent to the admin dashboard for review.

### Backend API
- The backend API manages data flow between the frontend dashboard and the mobile app.
- Provides endpoints for submitting grievances and retrieving reports.

## Contributing
We welcome contributions from the community! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request with a detailed description of your changes.
