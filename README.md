# Decision Engine - Loan Approval System

## Overview

    This project implements a decision engine for automating loan approvals in a fintech system. It processes personal codes, loan amounts, and loan periods to determine the maximum approved loan amount for an applicant.

## Most Critical Shortcoming of TICKET-101
    🚨 Issue: Lack of Age Restrictions in Loan Approval

    The initial implementation of TICKET-101 had a major flaw—it did not validate the applicant’s age before approving a loan.
    ❌ Why Is This a Problem?

    1️⃣ Regulatory Compliance – Financial institutions must adhere to legal age restrictions when approving loans. Ignoring this could result in legal violations.

    2️⃣ Financial Risk – Younger applicants are statistically more likely to default on loans, making this a critical risk factor.

    3️⃣ Incorrect Approvals – Since personal codes already contain age information, failing to check this leads to unnecessary risk exposure.
    ✅ How It Was Fixed in TICKET-102

    ✔️ Implemented age verification to reject loans for underage applicants and those exceeding the maximum eligible age.
    ✔️ Updated the frontend to provide user feedback when a loan is denied due to age constraints.

## New Feature: Age Restriction Implementation

    The decision engine now verifies an applicant's age based on their personal code before making a loan decision.

    Age Constraints Implemented:

        Minimum Age: 18 years

        Maximum Age: (Determined by life expectancy minus the max loan period)

    Frontend Enhancements:

        If an applicant is ineligible due to age, a clear rejection message is displayed.

        UI changes ensure better user experience when handling loan rejections.

## Other Fixes & Improvements
    🔹 1. Constructor Simplifications

        Replaced redundant Key? key declarations with super.key to improve code clarity.

        Applied the same update to LoanForm and NationalIdTextFormField.

    🔹 2. Widget Optimization

        Updated Row widget declaration to be fully constant, improving performance.

    🔹 3. Testing Enhancements

        Optimized pumpWidget calls in tests by making MaterialApp a constant.

    🔹 4. List Constant Fix

        Removed unnecessary const inside lists to ensure cleaner, optimized code.

    🔹 5. Updated Loan Period Constraints

        Loan periods are now correctly restricted between 12 and 48 months for better risk management.

## Conclusion

The original implementation of TICKET-101 overlooked age verification, a critical factor in loan approvals. With TICKET-102, the decision engine is now more robust, regulatory-compliant, and risk-aware. Additional code optimizations and UI improvements have also enhanced performance and maintainability.