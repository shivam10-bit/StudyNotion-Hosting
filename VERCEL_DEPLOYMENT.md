# Vercel Frontend Deployment Configuration

## Automatic Deployment Setup

This directory contains configuration for automatic deployment on [Vercel](https://vercel.com).

### Files Included:
- `.env.example` - Template for frontend environment variables
- `DEPLOYMENT_GUIDE.md` - Complete deployment walkthrough

### Quick Vercel Deployment Steps:

1. **Create Vercel Account**: Sign up at https://vercel.com with GitHub

2. **Import Project**:
   - Go to Dashboard → Add New → Project
   - Select your GitHub repository
   - Click "Import"

3. **Configure Project**:
   - **Project Name**: `studynotion` or your preferred name
   - **Framework Preset**: `Create React App`
   - **Root Directory**: Select root folder
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`
   - **Install Command**: `npm install`

4. **Set Environment Variables**:
   Go to Settings → Environment Variables → Add:
   ```
   REACT_APP_BASE_URL=https://your-backend-render-url.onrender.com
   ```
   
   After getting your Render backend URL, add it here.

5. **Deploy**: 
   - Click "Deploy"
   - Wait for build to complete (3-5 minutes)

### Your Frontend URL:
Once deployed, your frontend will be available at:
```
https://<project-name>.vercel.app
```

### Environment Variables:

**Required**:
- `REACT_APP_BASE_URL` - Your Render backend URL

**Optional** (if your application uses additional APIs):
- Add any other API endpoints your frontend needs

### Important Notes:

⚠️ **React Environment Variables**:
- Variables MUST be prefixed with `REACT_APP_`
- Variables without this prefix are ignored by Create React App
- Restart development server after changing `.env.local` file

⚠️ **Development vs Production**:
- Development: `.env.local` file (not committed to Git)
- Production: Set in Vercel Dashboard under Settings → Environment Variables

⚠️ **Deployment Trigger**:
- Automatic: Every push to main/master branch
- Manual: Dashboard → Redeploy button

### Build Optimization:

The project uses:
- **Tailwind CSS** - Included in class names
- **Redux** - For state management
- **Axios** - For API calls
- **React Router** - For navigation

### Common Issues:

**Blank Page After Deployment**:
1. Open browser DevTools (F12)
2. Check Console for errors
3. Verify REACT_APP_BASE_URL is set correctly
4. Check that backend is running

**API Connection Error**:
1. Verify backend URL in environment variable
2. Check CORS configuration in backend
3. Ensure backend service is active on Render

**Build Failed**:
1. Check build logs in Vercel dashboard
2. Verify all dependencies in package.json
3. Ensure no build warnings are treated as errors

### Monitoring:

- View deployment logs: Dashboard → Project → Deployments
- Monitor API calls: Browser DevTools → Network tab
- Check error tracking: See build logs for issues

### Rollback:

If deployment has issues:
- Dashboard → Project → Deployments
- Click on previous working deployment
- Click "Redeploy"

### Resources:

- [Vercel Documentation](https://vercel.com/docs)
- [Create React App Guide](https://create-react-app.dev)
- [Environment Variables in Vercel](https://vercel.com/docs/concepts/projects/environment-variables)
