# Render Backend Deployment Configuration

## Automatic Deployment Setup

This directory contains configuration for automatic deployment on [Render](https://render.com).

### Files Included:
- `.env.example` - Template for environment variables (don't commit actual .env!)
- `DEPLOYMENT_GUIDE.md` - Complete deployment walkthrough

### Quick Render Deployment Steps:

1. **Create Render Account**: Sign up at https://render.com with GitHub

2. **Connect Repository**: 
   - Go to Dashboard → New → Web Service
   - Connect your GitHub repository
   - Select this repository

3. **Configure Service**:
   - **Name**: `studynotion-backend`
   - **Environment**: Node
   - **Build Command**: `cd server && npm install`
   - **Start Command**: `node server/index.js`
   - **Instance Type**: Free

4. **Set Environment Variables**:
   ```
   MONGODB_URL=your_mongodb_url
   JWT_SECRET=your_random_secret_key
   CLOUD_NAME=your_cloudinary_name
   API_KEY=your_cloudinary_key
   API_SECRET=your_cloudinary_secret
   RAZORPAY_KEY=your_razorpay_key
   RAZORPAY_SECRET=your_razorpay_secret
   MAIL_HOST=smtp.gmail.com
   MAIL_USER=your_email@gmail.com
   MAIL_PASS=your_app_password
   FRONTEND_URL=https://your-vercel-domain.vercel.app
   PORT=8080
   NODE_ENV=production
   ```

5. **Deploy**: Click "Create Web Service" and wait for deployment

### Your Backend URL:
Once deployed, your backend will be available at:
```
https://<service-name>.onrender.com
```

### Environment Variables Details:

See `../server/.env.example` for complete environment variable descriptions.

### Important Notes:

⚠️ **Development vs Production**:
- Development: Use `http://localhost:3000` as REACT_APP_BASE_URL
- Production: Use your Render backend URL

⚠️ **Free Tier Considerations**:
- Services on free tier spin down after 15 minutes of inactivity
- This means the first request after inactivity may be slow
- For production, consider paid plans

⚠️ **Security**:
- Never commit `.env` files to GitHub
- Always use strong SECRET keys
- Rotate keys periodically in production

### Troubleshooting:

**Service Won't Deploy**:
1. Check build logs in Render dashboard
2. Verify all environment variables are set
3. Ensure package.json has correct dependencies

**Connection Error**:
1. Check MongoDB connection string
2. Verify IP whitelist in MongoDB Atlas includes 0.0.0.0/0
3. Test database connection locally first

**CORS Errors**:
1. Check `FRONTEND_URL` env variable matches your Vercel domain
2. Restart the service after changing CORS settings

### Support:
- [Render Documentation](https://render.com/docs)
- [Node.js on Render](https://render.com/docs/deploy-node-express-app)
