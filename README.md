## Bonus Section

1. What is PostgreSQL?
   PostgreSQL একটি ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম(RDBMS), যা ডেটা সংরক্ষণ , অনুসন্ধান, বিশ্লেষণ এবং পরিচালনার জন্য ব্যবহৃত হয়। এটি SQL(Structured Query Language) ব্যবহার করে এবং জটিল ডেটা কাঠামো ও অপারেশন পরিচালনায় সক্ষম। এটি ১৯৮৬ সালে গবেষণা প্রকল্প হিসেবে শুরু হয় University of California Berkeley তে। PostgreSQL নাম দেওয়া হয় ১৯৯৬ সালে।
   PostgreSQL দিয়ে যা করা যায়ঃ
   • ওয়েব অ্যাপ্লিকেশন
   • রিপোর্টিং ও বিশ্লেষণ
   • ব্যাংকিং ও ফিন্যান্স

2. What is the purpose of a database schema in PostgreSQL?
   PostgreSQL schema একটি শক্তিশালী ফিচার, যা আমাদের ডেটাবেইস অবজেক্টগুলোকে সংগঠিত করতে, ব্যবহারকারীর অ্যাক্সেস নিয়ন্ত্রণ করতে এবং বড় ডেটাবেইসে নামের দ্বন্দ্ব এড়াতে সহায়তা করে। সঠিকভাবে Schema ব্যবহার করে আমরা ডেটাবেইসের নিরাপত্তা, রক্ষণাবেক্ষণযোগ্যতা এবং বিস্তারযোগ্যতা বাড়াতে পারি। একটি সুশৃংখল ডেটাবেইস তৈরি করতে চাইলে অবশ্যই আমাদের schema সম্পর্কে ভালোভাবে জানা জরুরি।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL?
   Primary Key হলো টেবিলের একটি বা একাধিক কলাম যেগুলো প্রত্যেক রেকর্ডকে ইউনিক ও (NULL) ছাড়া চিহ্নিত করে। প্রতিটি রেকর্ডের জন্য একটি ইউনিক মান থাকতে হবে। NULL হতে পারবে না। আর একটি টেবিলে শুধু একটি primary key থাকতে পারে।
   Foreign Key হলো একটি টেবিলের কলাম যেটি অন্য টেবিলের primary key এর সাথে সংযুক্ত থাকে। এটি টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করে।

4. What is the difference between the VARCHAR and CHAR data types?
   CHAR(n) হল একটি নির্দিষ্ট দৈর্ঘ্যের ক্যারেক্টার ডেটা টাইপ। এটি সবসময় ঠিক n ক্যারেক্টার জায়গা সংরক্ষণ করে, আর ইনপুট ছোট হলে বাকি অংশ ফাকা স্পেসস দিয়ে পূরণ করে।
   যেমনঃ pin এর ক্ষেত্রে ব্যবহার করা হয়।
   VARCHAR হল একটি পরিবর্তনশীল দৈর্ঘ্যের ক্যারেক্টার ডেটা টাইপ। একটি সর্বোচ্চ n ক্যারেক্টার পর্যন্ত ডেটা সংরক্ষণ করে, এবং যতটুকু প্রয়োজন ততটুকু জায়গা নেয়।
   যেমনঃ নাম, ঠিকানা, মেসেজ ইত্যাদির জন্য উপযুক্ত।

5. How can you modify data using UPDATE statements?
   UPDATE স্টেটমেন্ট ব্যবহার করে PostgreSQL-এ একটি টেবিলের পুরানো ডেটা পরিবর্তন করা যায়। যদি WHERE কন্ডিশন ব্যবহার করা হয়, তাহলে নির্দিষ্ট কিছু রের্কডই আপডেট হবে।
   যেমনঃ
   UPDATE species
   SET conservation_status = 'Historic'
   WHERE discovery_date < '1800-01-01';
