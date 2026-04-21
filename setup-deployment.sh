#!/bin/bash
# StudyNotion Deployment Setup Script
# This script helps prepare your project for deployment

echo "==================================="
echo "StudyNotion Deployment Setup"
echo "==================================="
echo ""

# Check if .env files exist in correct locations
echo "📋 Checking environment setup..."
echo ""

if [ -f "server/.env.example" ]; then
    echo "✅ Backend .env.example found"
else
    echo "❌ Backend .env.example not found"
fi

if [ -f ".env.example" ]; then
    echo "✅ Frontend .env.example found"
else
    echo "❌ Frontend .env.example not found"
fi

echo ""
echo "==================================="
echo "📝 NEXT STEPS:"
echo "==================================="
echo ""
echo "1. CREATE MONGODB ATLAS ACCOUNT"
echo "   - Visit: https://www.mongodb.com/cloud/atlas"
echo "   - Create a free M0 cluster"
echo "   - Get your connection string"
echo ""
echo "2. SETUP CLOUDINARY"
echo "   - Visit: https://cloudinary.com"
echo "   - Copy Cloud Name, API Key, API Secret"
echo ""
echo "3. SETUP RAZORPAY"
echo "   - Visit: https://razorpay.com"
echo "   - Get test API Key and Secret"
echo ""
echo "4. SETUP EMAIL SERVICE"
echo "   - Gmail: Get app password from myaccount.google.com/apppasswords"
echo "   - Or use Mailtrap/SendGrid"
echo ""
echo "5. CREATE .env FILE IN SERVER FOLDER"
echo "   - Copy server/.env.example to server/.env"
echo "   - Fill in all the values from steps 1-4"
echo ""
echo "6. CREATE .env.local FILE IN ROOT FOLDER"
echo "   - Copy .env.example to .env.local"
echo "   - Set REACT_APP_BASE_URL=http://localhost:4000 (for local development)"
echo ""
echo "7. DEPLOY BACKEND TO RENDER"
echo "   - Visit: https://render.com"
echo "   - Connect your GitHub repository"
echo "   - Read: server/RENDER_DEPLOYMENT.md for detailed steps"
echo ""
echo "8. DEPLOY FRONTEND TO VERCEL"
echo "   - Visit: https://vercel.com"
echo "   - Import your GitHub repository"
echo "   - Read: VERCEL_DEPLOYMENT.md for detailed steps"
echo "   - Update REACT_APP_BASE_URL to your Render backend URL"
echo ""
echo "==================================="
echo "📚 DOCUMENTATION"
echo "==================================="
echo ""
echo "Main Guide: DEPLOYMENT_GUIDE.md"
echo "Backend: server/RENDER_DEPLOYMENT.md"
echo "Frontend: VERCEL_DEPLOYMENT.md"
echo ""
echo "==================================="
