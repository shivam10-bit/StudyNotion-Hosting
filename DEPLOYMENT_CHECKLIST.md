# 🚀 StudyNotion Deployment Checklist

Use this checklist to ensure all services are properly configured before deploying.

## Pre-Deployment Setup

### Step 1: MongoDB Atlas Setup
- [ ] Create MongoDB Atlas account at https://www.mongodb.com/cloud/atlas
- [ ] Create a free M0 cluster
- [ ] Create database user (save username/password)
- [ ] Allow access from anywhere (0.0.0.0/0) for free tier
- [ ] Get connection string in format: `mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/dbname`
- [ ] Copy connection string

### Step 2: Cloudinary Setup
- [ ] Create Cloudinary account at https://cloudinary.com
- [ ] Go to Dashboard
- [ ] Copy **Cloud Name**
- [ ] Copy **API Key**
- [ ] Copy **API Secret**

### Step 3: Razorpay Setup
- [ ] Create Razorpay account at https://razorpay.com
- [ ] Go to Settings → API Keys
- [ ] Copy **Key ID** (test key for development)
- [ ] Copy **Key Secret** (test key for development)

### Step 4: Email Configuration
Choose one option:

#### Option A: Gmail (Recommended for testing)
- [ ] Enable 2-factor authentication on Gmail account
- [ ] Visit https://myaccount.google.com/apppasswords
- [ ] Generate app password for "Mail" and "Windows Computer"
- [ ] Copy the 16-character app password
- [ ] MAIL_HOST: `smtp.gmail.com`
- [ ] MAIL_USER: Your Gmail address
- [ ] MAIL_PASS: The 16-character app password

#### Option B: Mailtrap
- [ ] Create account at https://mailtrap.io
- [ ] Get SMTP configuration
- [ ] Copy credentials

### Step 5: Generate JWT Secret
- [ ] Open terminal and run: `openssl rand -base64 32`
- [ ] Or use online generator for a random string (min 32 characters)
- [ ] Copy the generated secret

### Step 6: GitHub Preparation
- [ ] Ensure project is pushed to GitHub
- [ ] Verify `.gitignore` includes `.env` files
- [ ] All code is committed and pushed

---

## Backend Deployment (Render)

### Step 7: Create & Configure Render Service
- [ ] Create account at https://render.com
- [ ] Sign in with GitHub
- [ ] Click "New" → "Web Service"
- [ ] Connect your GitHub repository
- [ ] Select the correct repository

### Step 8: Configure Render Service Details
- [ ] Name: `studynotion-backend`
- [ ] Environment: `Node`
- [ ] Region: Closest to your users
- [ ] Build Command: `cd server && npm install`
- [ ] Start Command: `node server/index.js`
- [ ] Instance Type: `Free`

### Step 9: Add Environment Variables to Render
Go to Render Service → Settings → Environment:
- [ ] `MONGODB_URL` = Your MongoDB connection string
- [ ] `JWT_SECRET` = Your generated JWT secret
- [ ] `CLOUD_NAME` = Cloudinary Cloud Name
- [ ] `API_KEY` = Cloudinary API Key
- [ ] `API_SECRET` = Cloudinary API Secret
- [ ] `RAZORPAY_KEY` = Razorpay Key ID
- [ ] `RAZORPAY_SECRET` = Razorpay Secret
- [ ] `MAIL_HOST` = `smtp.gmail.com` (or your email provider)
- [ ] `MAIL_USER` = Your email address
- [ ] `MAIL_PASS` = Your app password / email password
- [ ] `NODE_ENV` = `production`
- [ ] `PORT` = `8080`
- [ ] `FRONTEND_URL` = Leave for now (update after Vercel deployment)

### Step 10: Deploy Backend
- [ ] Click "Create Web Service"
- [ ] Wait for deployment to complete
- [ ] Check status - should be "live" (green)
- [ ] Copy your backend URL (format: `https://studynotion-backend.onrender.com`)
- [ ] Test with: `https://your-backend-url/` - should see success message

---

## Frontend Deployment (Vercel)

### Step 11: Create & Configure Vercel Project
- [ ] Create account at https://vercel.com
- [ ] Sign in with GitHub
- [ ] Click "Add New" → "Project"
- [ ] Select your GitHub repository
- [ ] Click "Import"

### Step 12: Configure Vercel Project Details
- [ ] Project Name: Your preferred name
- [ ] Framework Preset: `Create React App`
- [ ] Root Directory: Leave empty (select root)
- [ ] Build Command: `npm run build`
- [ ] Output Directory: `build`
- [ ] Install Command: `npm install`

### Step 13: Add Environment Variables to Vercel
Go to Vercel Dashboard → Settings → Environment Variables:
- [ ] `REACT_APP_BASE_URL` = Your Render backend URL (from Step 10)

### Step 14: Deploy Frontend
- [ ] Click "Deploy"
- [ ] Wait for deployment to complete
- [ ] Check status - should be "Ready"
- [ ] Copy your frontend URL (format: `https://your-project.vercel.app`)
- [ ] Test by opening the URL in browser

---

## Post-Deployment Configuration

### Step 15: Update Backend CORS
- [ ] Go back to Render → Your backend service
- [ ] Go to Settings → Environment
- [ ] Update `FRONTEND_URL` = Your Vercel URL from Step 14
- [ ] Save and wait for automatic redeployment

### Step 16: Test the Complete Flow
- [ ] Open your Vercel frontend URL
- [ ] Try user signup with a test email
- [ ] Check that OTP email is received
- [ ] Complete signup
- [ ] Login to the application
- [ ] Test course enrollment or payment

### Step 17: Monitor & Troubleshoot
- [ ] Check Render logs for backend errors: Dashboard → Current Logs
- [ ] Check Vercel logs for frontend errors: Dashboard → Deployments
- [ ] Use browser DevTools Console for frontend errors (F12)
- [ ] Test API calls with browser Network tab

---

## Security & Production Readiness

### Step 18: Production Hardening
- [ ] Verify `.env` files are NOT in GitHub (.gitignore check)
- [ ] Verify sensitive data is only in Render/Vercel environment
- [ ] Change Razorpay keys from test to live (if going to production)
- [ ] Set up email with transactional service (optional upgrade)
- [ ] Enable HTTPS (both Render and Vercel do this automatically)
- [ ] Consider upgrading from free tier for production use

### Step 19: Monitoring Setup (Optional)
- [ ] Set up error tracking (Sentry, LogRocket, etc.)
- [ ] Enable analytics
- [ ] Configure backup strategy for MongoDB
- [ ] Set monitoring alerts for service status

---

## Common Issues & Solutions

### Backend Issues
| Issue | Solution |
|-------|----------|
| Service won't build | Check MongoDB, API keys in env vars |
| 502 Bad Gateway | Backend crashed - check logs in Render |
| CORS errors | Verify FRONTEND_URL in Render env vars |
| Database connection failed | Check MongoDB connection string format |

### Frontend Issues
| Issue | Solution |
|-------|----------|
| Blank white page | Check browser console for errors |
| API calls failing | Verify REACT_APP_BASE_URL is correct |
| Page loads but no data | Backend might be spinning down - wait 10 seconds and retry |

### Email Issues
| Issue | Solution |
|-------|----------|
| Emails not sending | Check Gmail app password is correct |
| Permission denied | Enable less secure apps or use app password |
| SMTP timeout | Check MAIL_HOST and port configuration |

---

## Final Verification

- [ ] Frontend loads without errors
- [ ] Backend API responds to requests
- [ ] User signup/login works
- [ ] Email notifications are sent
- [ ] Database operations work correctly
- [ ] File uploads to Cloudinary work
- [ ] All links and navigation work
- [ ] Mobile responsive design looks good
- [ ] No console errors in browser DevTools

---

## 🎉 Deployment Complete!

Your StudyNotion application is now live! 

**Frontend URL**: `https://your-project.vercel.app`  
**Backend URL**: `https://your-backend.onrender.com`

### Support Resources
- [Render Docs](https://render.com/docs)
- [Vercel Docs](https://vercel.com/docs)
- [MongoDB Atlas Docs](https://docs.atlas.mongodb.com)
- [Cloudinary Docs](https://cloudinary.com/documentation)

### Next Steps
- Monitor application performance
- Set up automated backups
- Plan scaling for increased traffic
- Consider custom domain setup
- Set up analytics and monitoring
