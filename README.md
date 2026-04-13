# StudyNotion - EdTech Platform

A comprehensive full-stack education platform built with the MERN stack that enables educators to create and sell courses while allowing students to learn and grow.

## Table of Contents

- [Tech Stack](#tech-stack)
- [Features](#features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Project](#running-the-project)
- [API Endpoints](#api-endpoints)
- [Database Models](#database-models)

## Tech Stack

### Frontend
- **React** 18.2.0 - UI library
- **Redux Toolkit** - State management
- **React Router DOM** - Client-side routing
- **Axios** - HTTP client
- **Tailwind CSS** - Styling
- **React Hook Form** - Form handling
- **React Hot Toast** - Notifications
- **Chart.js & React ChartJS 2** - Data visualization
- **Swiper** - Carousel/slider component
- **React Markdown** - Markdown rendering

### Backend
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM for MongoDB
- **JWT** - Authentication
- **Bcrypt** - Password hashing
- **Cloudinary** - Image/video hosting
- **Razorpay** - Payment gateway
- **Nodemailer** - Email service
- **Node Schedule** - Scheduled tasks

## Features

### For Students
- User authentication (signup/login)
- Browse and search courses
- Enroll in courses with payment integration
- Watch course videos and track progress
- Rate and review courses
- Access course materials
- Dashboard with learning statistics
- Password reset and profile management

### For Instructors
- Create and manage courses
- Add course sections and subsections
- Upload course videos
- Set course pricing
- View course analytics
- Manage student ratings and reviews
- Track course enrollment

### General
- Email verification and notifications
- Payment processing with Razorpay
- OTP-based password reset
- Category-based course organization
- Contact us functionality
- Responsive design

## Project Structure

```
studynotion-edtech-project-main/
├── public/                    # Static files
├── server/                    # Backend
│   ├── config/               # Configuration files
│   │   ├── cloudinary.js    # Cloudinary setup
│   │   ├── database.js      # MongoDB connection
│   │   └── razorpay.js      # Razorpay setup
│   ├── controllers/          # Route handlers
│   ├── middleware/           # Auth and other middleware
│   ├── models/              # MongoDB schemas
│   ├── routes/              # API routes
│   ├── mail/                # Email templates
│   ├── utils/               # Utility functions
│   └── index.js             # Server entry point
├── src/                       # Frontend
│   ├── components/          # React components
│   │   ├── Common/          # Shared components
│   │   └── core/            # Core feature components
│   ├── pages/               # Page components
│   ├── slices/              # Redux slices
│   ├── services/            # API calls
│   ├── hooks/               # Custom hooks
│   ├── data/                # Static data
│   ├── utils/               # Utility functions
│   └── App.jsx              # Root component
├── package.json             # Root dependencies
└── README.md                # This file
```

## Prerequisites

- **Node.js** v14 or higher
- **npm** or **yarn**
- **MongoDB** instance (local or cloud)
- **Cloudinary** account for media hosting
- **Razorpay** account for payments
- **Nodemailer** compatible email service

## Installation

### 1. Clone the repository
```bash
git clone <repository-url>
cd studynotion-edtech-project-main
```

### 2. Install Root Dependencies
```bash
npm install
```

This will install the concurrently package needed to run both servers simultaneously.

### 3. Install Backend Dependencies
```bash
cd server
npm install
cd ..
```

### 4. Install Frontend Dependencies
Frontend dependencies are already installed in the root `npm install` command.

## Configuration

### Backend Environment Variables

Create a `.env` file in the `server/` directory with the following variables:

```env
# Server
PORT=4000
NODE_ENV=development

# Database
MONGODB_URL=mongodb+srv://<username>:<password>@cluster.mongodb.net/studynotion

# JWT
JWT_SECRET=your_jwt_secret_key
JWT_EXPIRE=7d
REFRESH_TOKEN_EXPIRE=7d
REFRESH_TOKEN_SECRET=your_refresh_token_secret

# Cloudinary
CLOUDINARY_NAME=your_cloudinary_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Razorpay
RAZORPAY_KEY_ID=your_razorpay_key
RAZORPAY_KEY_SECRET=your_razorpay_secret

# Email
MAIL_HOST=smtp.gmail.com
MAIL_USER=your_email@gmail.com
MAIL_PASS=your_app_password
```

### Frontend Environment Variables

Create a `.env` file in the root directory:

```env
REACT_APP_BASE_URL=http://localhost:4000/api/v1
```

## Running the Project

### Development Mode (Both Client & Server)

Run the following command in the root directory:

```bash
npm run dev
```

This will start:
- **Frontend**: http://localhost:3000
- **Backend**: http://localhost:4000

### Frontend Only
```bash
npm start
```

### Backend Only
```bash
npm run server
```

### Production Build
```bash
npm run build
```

## API Endpoints

### Authentication Routes (`/api/v1/auth/`)
- `POST /signup` - Register new user
- `POST /login` - User login
- `POST /sendotp` - Send OTP for email verification
- `POST /changepassword` - Change password
- `POST /resetpassword` - Reset forgotten password

### Course Routes (`/api/v1/course/`)
- `GET /getAllCourses` - Get all courses
- `GET /getCourseDetails/:courseId` - Get specific course
- `POST /createCourse` - Create new course (instructor)
- `POST /addSectionToCoure` - Add section to course
- `POST /updateSection` - Update course section
- `POST /deleteSection` - Delete section
- `POST /createSubSection` - Create subsection
- `POST /updateSubSection` - Update subsection
- `DELETE /deleteSubSection` - Delete subsection

### Payment Routes (`/api/v1/payment/`)
- `POST /capturePayment` - Process payment
- `POST /verifySignature` - Verify Razorpay signature

### User Routes (`/api/v1/user/`)
- `GET /getUserDetails` - Get user profile
- `PUT /updateProfile` - Update user profile
- `DELETE /deleteProfile` - Delete account
- `PUT /updateDisplayPicture` - Update profile picture

### Contact Routes (`/api/v1/reach/`)
- `POST /contact` - Submit contact form

## Database Models

### User Model
- Email, password (hashed)
- Account type (Student/Instructor)
- Profile reference
- Enrolled courses
- Created at timestamp

### Course Model
- Title, description, rating
- Price, language
- Instructor reference
- Sections array
- Category reference
- Thumbnail image

### Section Model
- Name, description
- Course reference
- Subsections array
- Order

### SubSection Model
- Title, description
- Video URL (Cloudinary)
- Duration
- Section reference

### Category Model
- Name, description

### Rating & Review Model
- Rating (1-5)
- Review text
- Course reference
- User reference

### CourseProgress Model
- Student reference
- Course reference
- Completed lectures
- Progress percentage

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Support

For issues or questions, please open an issue in the repository.

---

**Happy Learning! 📚**
