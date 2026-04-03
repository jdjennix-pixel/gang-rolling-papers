$skillsData = @"
UI Design System|Toolkit for creating and maintaining scalable UI design systems with tokens, responsive rules, accessibility and developer handoff docs.
Copywriting|Guidelines and workflows for writing high-converting marketing copy for web pages, including headlines, CTAs, and page structures.
Tailwind Design System v4|Build scalable, responsive, and accessible design systems with Tailwind CSS v4, design tokens, and reusable React UI components.
Three.js Animation|Guide to creating, controlling, and optimizing animations in Three.js, including keyframes, skeletal rigs, morph targets, blending, and procedural motion.
Web Interface Guidelines|Checklist for reviewing UI code for compliance with comprehensive web interface, accessibility, performance, and content guidelines.
Marketing Psychology And Mental Models|Applies psychological principles and mental models to design ethical, effective marketing, pricing, and growth strategies.
Analytics Tracking|Guide for planning, implementing, and validating analytics tracking with GA4, GTM, and UTM strategies.
Interaction Design|Design and implement purposeful UI motion, microinteractions, and feedback patterns to enhance usability and user delight.
Landing Page High-Conversion Web Design|Guidelines and workflows for designing and writing high-converting SaaS and service landing pages, covering structure, layout, copy, and SEO/AEO.
Frontend Design for Distinctive Interfaces|Guides creation of distinctive, production-grade frontend interfaces with bold, cohesive aesthetics and refined implementation.
GSAP Web Animation Skill|Guide to implementing and debugging professional GSAP-based web animations, timelines, and ScrollTrigger interactions.
Web Design Reviewer|Inspects web interfaces for layout, responsive, accessibility, and visual issues, then applies targeted source code fixes and re-verifies results.
Anime.js v4 Skill|Comprehensive guide to using Anime.js v4 for JavaScript-driven web animations, timelines, SVG, scroll effects, and draggable interactions.
Vanta.js Animated WebGL Backgrounds Skill|Guide to setting up, configuring, and integrating Vanta.js animated WebGL backgrounds, including React usage, resizing, and performance considerations.
Animation Systems for Product-Grade Web Motion|Guides designing and implementing tasteful, high-performance product-grade web animation systems inspired by Stripe, Linear, Apple, and Vercel.
Aura Asset Images for Design Mockups|Guides using Aura’s asset library to source Unsplash-style images plus recommended crops and resolutions for design and marketing use.
CSS Border Gradient Skill|Teach how to create and customize CSS gradient borders using a pseudo-element mask, including Tailwind-friendly usage and common pitfalls.
Progressive Blur Skill|Implement layered CSS progressive blur overlays at the top or bottom of the viewport using multiple masked backdrop-filter layers.
High-Conversion SaaS Pricing Page Design|Framework and checklists for designing and writing a high-converting SaaS pricing page, including layout patterns, copy, FAQs, and SEO/AEO.
Responsive Design|Master modern responsive design techniques using container queries, fluid typography, CSS Grid, and mobile-first strategies for adaptive interfaces.
cobe.js Lightweight WebGL Globe Skill|Implement a lightweight interactive WebGL globe with cobe.js, including responsive canvas setup, markers, interaction, and React/Next.js integration.
Matter.js Skill|Guidelines and patterns for setting up Matter.js 2D physics scenes, interactions, and cleanup in web environments.
CSS Alpha Masking Skill|Apply CSS linear-gradient-based alpha masks for horizontal or vertical edge fades using mask-image and -webkit-mask-image.
Unsplash Asset Images for Avatars and Backgrounds|Guidelines and curated Unsplash picks for avatars, portraits, backgrounds, and wallpapers with correct sizes and aspect ratios.
Canvas Design|Guides creating original visual design philosophies and expressing them as meticulously crafted, museum-quality PNG or PDF art with minimal text.
shadcn|How to install shadcn/ui, set up dependencies, and structure your React app across multiple frameworks.
GSAP React Installation|Provides npm commands to install GSAP and its React integration package.
Progressive Blur UI Overlay|Implement a customizable progressive gradient blur overlay at the top or bottom of the viewport using layered CSS backdrop-filters.
Advanced UI Prompt Architect|Generates structured prompts for creating professional SaaS interfaces, landing pages, and dashboards with clear layout, components, and visual design rules.
SaaS Light Mode Designer|Guides the design of premium light-mode SaaS marketing pages with editorial grids, restrained color, framing lines, subtle motion, and conversion-focused layouts.
Branding Strategies|Defines and structures brand strategy, storytelling, voice, and visual identity for consistent branding across touchpoints.
GEO Strategies|Guides generative engine optimization strategies to improve content visibility and citation in AI search answers across tools like ChatGPT, Perplexity, and AI Overviews.
Image Optimization Analysis|Analyze and optimize webpage images for SEO, performance, formats, responsiveness, lazy loading, and CLS prevention.
Features Page Generator|Guides the planning, copy, structure, and SEO of high-converting product features pages.
Structured SaaS Interface System|Guidelines for designing a polished SaaS marketing interface with strong layout systems, realistic product dashboards, subtle motion, and refined visual hierarchy.
Cold Start Strategies|Guides cold start strategy for AI/SaaS products to get first users, traction, and validate product-market fit from zero.
Skill Creator|Guidance for creating, structuring, editing, packaging, and iterating reusable Claude skills with metadata, resources, and best practices.
Artifacts Builder|Builds complex single-file Claude artifacts with React, TypeScript, Tailwind CSS, and shadcn/ui using init and bundling scripts.
Advanced Light SaaS UI System|Guides creation of polished light-mode SaaS marketing interfaces with varied layouts, rich product UI components, strong hierarchy, and subtle motion.
Algorithmic Art|Create generative art with p5.js using seeded randomness, noise, flow fields, particle systems, recursive forms, and palette-based experimentation.
Internal Communications|Guides writing internal company communications like status reports, leadership updates, newsletters, FAQs, and incident reports using preferred formats.
BTR Motion Pattern Registry|A structured guide for selecting and applying web animation patterns across multiple technologies using a registry-first workflow.
Paywall and Upgrade Screen CRO|Guidance for optimizing in-app paywalls, upgrade screens, and checkout flows to increase conversion rates.
"@

$targetDir = "C:\Users\jdjen\OneDrive\Google Antigravity\New folder (2)\UI_Design_Skills"
if (!(Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
}

$lines = $skillsData -split "`n"
foreach ($line in $lines) {
    if ($line.Trim() -eq "") { continue }
    $parts = $line -split "\|"
    $title = $parts[0].Trim()
    $desc = $parts[1].Trim()
    
    $filename = $title -replace '[^a-zA-Z0-9]', '-' -replace '-+', '-' -replace '^-|-$', ''
    $filename = $filename.ToLower() + ".md"
    $filepath = Join-Path $targetDir $filename
    
    $fileContent = @"
---
name: $title
description: $desc
---

# $title

**Description:** $desc

## Role
You are an expert design/engineering AI focused on `$title`.

## Instructions
1. When asked to use this skill, follow all standard industry best practices for `$title`.
2. $desc
3. Write clean, accessible, and performant code or copy.
4. If generating components, use structured methodologies.

## Best Practices
- Always prioritize modern, scaleable approaches.
- Provide clear instructions and examples to the user.
"@

    Set-Content -Path $filepath -Value $fileContent -Encoding UTF8
}

Write-Host "Successfully generated skills in $targetDir"
