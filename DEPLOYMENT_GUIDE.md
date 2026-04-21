# StudyNotion Deployment Guide 

Complete guide to deploy StudyNotion on Render (Backend) and Vercel (Frontend).

## Table of Contents
1. [Prerequisites Setup](#prerequisites-setup)
2. [Backend Deployment (Render)](#backend-deployment-render)
3. [Frontend Deployment (Vercel)](#frontend-deployment-vercel)
4. [Post-Deployment Configuration](#post-deployment-configuration)

---

## Prerequisites Setup

### 1. MongoDB Atlas Setup

1. Go to [mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas)
2. Sign up or log in
3. Create a new organization and project
4. Click "Create" to deploy a new cluster
5. Select "M0 Free" tier
6. Choose cloud provider and region (closest to your users)
7. Complete the security setup:
   - Create a database user (save username/password)
   - Add IP address (click "Allow Access from Anywhere" for now)
8. Click "Connect" and get your connection string:
   ```
   mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority
   ```
9. Save this connection string - you'll need it for the .env file

### 2. Cloudinary Setup (Image Upload)

1. Go to [cloudinary.com](https://cloudinary.com)
2. Sign up or log in
3. Go to Dashboard
4. Copy the following:
   - **Cloud Name**
   - **API Key**
   - **API Secret**

### 3. Razorpay Setup (Payment Gateway)

1. Go to [razorpay.com](https://razorpay.com)
2. Sign up or log in
3. Go to Settings → API Keys
4. Copy:
   - **Key ID**
   - **Key Secret**
5. Note: For testing, use test keys first

### 4. Email Service Setup (Nodemailer)

You have two options:

**Option A: Gmail (Recommended for testing)**
1. Go to [myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
2. Generate an App Password for your Gmail
3. Copy the 16-character password

**Option B: Mailtrap or SendGrid**
- Go to [mailtrap.io](https://mailtrap.io) or [sendgrid.com](https://sendgrid.com)
- Create account and get API credentials

### 5. GitHub & Git Setup

1. Ensure your project is pushed to GitHub
2. Commands:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   ```

---

## Backend Deployment (Render)

### Step 1: Create Render Account & Service

1. Go to [render.com](https://render.com)
2. Sign up with GitHub
3. Click "New +" → "Web Service"
4. Connect your GitHub repository
5. Select the repository containing your project

### Step 2: Configure Backend Service

1. **Name**: `studynotion-backend`
2. **Environment**: `Node`
3. **Build Command**: `cd server && npm install`
4. **Start Command**: `node server/index.js`
5. **Instance Type**: Select "Free"

### Step 3: Set Environment Variables

On Render dashboard, go to "Environment":

```env
# Database
MONGODB_URL=mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/studynotion?retryWrites=true&w=majority

# Cloudinary
CLOUD_NAME=your_cloud_name
API_KEY=your_api_key
API_SECRET=your_api_secret

# Razorpay
RAZORPAY_KEY_ID=your_key_id
RAZORPAY_SECRET=your_key_secret

# Email Configuration
MAIL_HOST=smtp.gmail.com
MAIL_USER=your_email@gmail.com
MAIL_PASS=your_16_char_app_password
MAIL_FROM_EMAIL=noreply@studynotion.com

# JWT & Security
JWT_SECRET=your_strong_secret_key_min_32_chars

# Environment
NODE_ENV=production
PORT=8080

# CORS
FRONTEND_URL=https://your-vercel-domain.vercel.app
```

### Step 4: Deploy

1. Click "Create Web Service"
2. Wait for deployment (5-10 minutes)
3. Your backend URL: `https://studynotion-backend.onrender.com`
4. Save this URL for frontend configuration

---

## Frontend Deployment (Vercel)

### Step 1: Create Vercel Account

1. Go to [vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Click "Import Project"
4. Select your GitHub repository

### Step 2: Configure Frontend Project

1. **Project Name**: `studynotion-frontend`
2. **Framework Preset**: `Create React App`
3. **Root Directory**: Leave empty (or select root)

### Step 3: Set Environment Variables

In Vercel dashboard → Settings → Environment Variables:

```env
REACT_APP_BASE_URL=https://studynotion-backend.onrender.com
```

### Step 4: Build Settings

- **Build Command**: `npm run build`
- **Output Directory**: `build`
- **Install Command**: `npm install`

### Step 5: Deploy

1. Click "Deploy"
2. Wait for deployment (3-5 minutes)
3. Your frontend URL: `https://your-project-name.vercel.app`

---

## Post-Deployment Configuration

### 1. Update Backend CORS

After getting your Vercel URL, update the backend CORS:

Edit `server/index.js`:
```javascript
app.use(cors({
  origin: "https://your-vercel-domain.vercel.app",
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
  allowedHeaders: ["Content-Type", "Authorization"],
}));
```

Or use environment variable (better approach).

### 2. Update Frontend API Base URL

Create/Update `src/.env`:
```env
REACT_APP_BASE_URL=https://studynotion-backend.onrender.com
```

### 3. Test the Connection

1. Visit your Vercel frontend URL
2. Try uploading a course image (tests Cloudinary)
3. Try making a payment (tests Razorpay)
4. Check course enrollments
5. Test email notifications

### 4. MongoDB Security (Production)

1. Go back to MongoDB Atlas
2. Change IP whitelist to only your Render instance IP
3. Or create a VPC peering

---

## Troubleshooting

### Backend Won't Deploy

```bash
# Check logs on Render dashboard
# Common issues:
- npm install failing: Check package.json dependencies
- PORT not set: Render expects PORT env variable
- Missing env variables: Check all are set in Render dashboard
```

### Frontend Shows Blank Page

```bash
# Check browser console (F12) for errors
# Common issues:
- REACT_APP_BASE_URL not set
- CORS error: Check backend CORS config
- API not responding: Verify backend is running
```

### Database Connection Error

```bash
# Check MongoDB connection string format:
# mongodb+srv://username:password@cluster.mongodb.net/dbname
# Ensure password doesn't have special characters (URL encode if needed)
# Verify IP whitelist includes 0.0.0.0/0 or Render IP
```

### Email Not Sending

```bash
# For Gmail:
- Enable 2-factor authentication
- Create app password (16 characters)
- Don't use your regular Gmail password

# For other services:
- Verify SMTP credentials
- Check API keys
```

---

## Important Notes

⚠️ **Security Reminders:**
- Never commit `.env` files to GitHub
- Use strong JWT_SECRET (minimum 32 characters)
- Keep API keys private
- Use separate keys for development and production
- Enable HTTPS (Vercel & Render do this automatically)

## Support Resources

- [Render Documentation](https://render.com/docs)
- [Vercel Documentation](https://vercel.com/docs)
- [MongoDB Atlas Docs](https://docs.atlas.mongodb.com)
- [Cloudinary Upload API](https://cloudinary.com/documentation/upload_widget)

---

**Deployment Time Estimate**: 30-45 minutes for first-time setup including all services
