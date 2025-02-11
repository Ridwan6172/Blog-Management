-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 12:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `status` enum('pending','published') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `notification` tinyint(1) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `author_name`, `status`, `created_at`, `notification`, `image`) VALUES
(3, 'Mastering Laravel: Building a Role-Based Blog System from Scratch', 'In the ever-evolving world of web development, Laravel has emerged as one of the most powerful and developer-friendly PHP frameworks. If you\'re looking to build a blog system with role-based access control (RBAC), Laravel provides all the tools you need to create a secure and efficient system.', 1, 'User 1', 'pending', '2025-02-06 12:39:28', 1, NULL),
(6, 'The Expanding Universe of AI: A Comprehensive Look at Artificial Intelligence', 'Artificial intelligence (AI) has rapidly transitioned from a science fiction fantasy to a tangible force reshaping our world.  It\'s no longer a futuristic concept but a present reality, permeating industries from healthcare and finance to transportation and entertainment.  Understanding AI, its capabilities, limitations, and potential impact is crucial in navigating this evolving landscape. This comprehensive look delves into the multifaceted world of AI, exploring its various facets and future implications.   \r\n\r\nWhat is Artificial Intelligence?\r\n\r\nAt its core, AI refers to the ability of a computer or machine to mimic human intelligence. This encompasses a broad range of cognitive functions, including learning, problem-solving, decision-making, perception, and language understanding.  Essentially, AI aims to create machines that can think and act intelligently, often without explicit programming for every single scenario.   \r\n\r\nThe Branches of AI:\r\n\r\nThe field of AI is not monolithic; it comprises various subfields, each with its own focus:   \r\n\r\nMachine Learning (ML): This is arguably the most prevalent branch of AI today. ML focuses on enabling computers to learn from data without explicit programming. Algorithms are used to identify patterns, make predictions, and improve their performance over time through experience. Subcategories within ML include:\r\nSupervised Learning: The algorithm learns from labeled data (input-output pairs).   \r\nUnsupervised Learning: The algorithm learns from unlabeled data, identifying patterns and structures on its own.   \r\nReinforcement Learning: The algorithm learns through trial and error, receiving rewards or penalties for its actions.   \r\n  \r\nDeep Learning (DL): A subfield of ML, deep learning utilizes artificial neural networks with multiple layers to analyze complex data and extract intricate features. DL has been instrumental in breakthroughs in image recognition, natural language processing, and speech recognition.   \r\nNatural Language Processing (NLP): This branch focuses on enabling computers to understand, interpret, and generate human language. NLP powers chatbots, translation tools, and sentiment analysis systems.   \r\nComputer Vision: This field aims to equip computers with the ability to \"see\" and interpret images and videos, similar to human vision. Applications include facial recognition, object detection, and medical image analysis.   \r\nRobotics: This interdisciplinary field combines AI with engineering to create robots capable of performing tasks autonomously or with human guidance. AI empowers robots with perception, planning, and control capabilities.   \r\nApplications of AI Across Industries:\r\n\r\nThe impact of AI is being felt across a wide range of sectors:\r\n\r\nHealthcare: AI is used for drug discovery, disease diagnosis, personalized medicine, and robotic surgery.   \r\nFinance: AI powers fraud detection, algorithmic trading, risk management, and personalized financial advice.   \r\nTransportation: Self-driving cars, optimized logistics, and traffic management systems are all driven by AI.   \r\nRetail: AI is used for personalized recommendations, inventory management, and customer service through chatbots.   \r\nManufacturing: AI-powered robots automate production processes, improve quality control, and predict equipment failures.   \r\nEntertainment: AI is used for personalized content recommendations, game development, and creating special effects in movies.   \r\nEducation: AI can personalize learning experiences, provide automated feedback, and assist teachers with administrative tasks.   \r\nThe Ethical Considerations of AI:\r\n\r\nThe rapid advancement of AI raises several ethical concerns that need careful consideration:\r\n\r\nBias: AI algorithms can perpetuate and amplify existing biases in the data they are trained on, leading to unfair or discriminatory outcomes.   \r\nJob Displacement: As AI automates tasks, there are concerns about potential job losses in certain sectors.   \r\nPrivacy: AI systems often collect and analyze vast amounts of data, raising concerns about individual privacy and data security.   \r\nAccountability: Determining responsibility when an AI system makes a mistake or causes harm is a complex issue.\r\nAutonomous Weapons: The development of AI-powered autonomous weapons systems raises serious ethical and security concerns.   \r\nThe Future of AI:\r\n\r\nThe future of AI is full of both promise and uncertainty.  While the potential benefits are enormous, addressing the ethical challenges is crucial to ensure that AI is used for the benefit of humanity.  Some key areas of future development include:\r\n\r\nExplainable AI (XAI): Making AI decision-making processes more transparent and understandable.   \r\nArtificial General Intelligence (AGI): The hypothetical creation of AI with human-level intelligence and general-purpose problem-solving abilities.   \r\nAI and Creativity: Exploring the potential of AI to generate creative content, such as art, music, and literature.   \r\nConclusion:\r\n\r\nArtificial intelligence is a transformative technology with the potential to revolutionize every aspect of our lives.  While challenges and ethical considerations exist, the opportunities presented by AI are immense. By fostering collaboration between researchers, policymakers, and the public, we can harness the power of AI to create a better future for all.  Understanding its capabilities, limitations, and potential impact is crucial for navigating this rapidly evolving landscape and shaping the future of AI responsibly.', 4, 'Rahim', 'published', '2025-02-09 10:24:57', 1, NULL),
(12, 'AI: The Next Frontier of Human Evolution?', 'Artificial intelligence (AI) is no longer a figment of science fiction; it\'s a rapidly evolving reality that\'s transforming our world in profound ways. From the mundane to the groundbreaking, AI is weaving its way into the fabric of our lives, raising both exciting possibilities and complex challenges. This exploration delves into the multifaceted realm of AI, examining its current state, potential future, and the critical questions we must address as we venture into this new frontier.\r\n\r\nThe Rise of Intelligent Machines:\r\n\r\nAI, at its core, is about creating machines capable of mimicking human intelligence. This involves a range of cognitive functions, including:\r\n\r\nLearning: Acquiring knowledge and improving performance through experience.\r\nProblem-solving: Finding solutions to complex challenges.\r\nDecision-making: Choosing the best course of action from available options.\r\nPerception: Interpreting sensory information from the environment.\r\nLanguage understanding: Comprehending and generating human language.\r\nThe Building Blocks of AI:\r\n\r\nThe field of AI is comprised of various interconnected branches, each contributing to the overall advancement of intelligent machines:\r\n\r\nMachine Learning (ML): This is the engine driving much of the current AI revolution. ML empowers computers to learn from data without explicit programming, enabling them to identify patterns, make predictions, and adapt to new situations.\r\nDeep Learning (DL): A subfield of ML, DL utilizes artificial neural networks with multiple layers to analyze vast amounts of data and extract intricate features. DL has fueled breakthroughs in image recognition, natural language processing, and other areas.\r\nNatural Language Processing (NLP): This branch focuses on enabling computers to understand, interpret, and generate human language, powering chatbots, translation tools, and sentiment analysis systems.\r\nComputer Vision: This field equips computers with the ability to \"see\" and interpret images and videos, similar to human vision, with applications in facial recognition, object detection, and medical image analysis.\r\nRobotics: This interdisciplinary field combines AI with engineering to create robots capable of performing tasks autonomously or with human guidance, enhancing their perception, planning, and control capabilities.\r\nAI in Action: Transforming Industries:\r\n\r\nThe impact of AI is reverberating across industries, reshaping how we live and work:\r\n\r\nHealthcare: AI is accelerating drug discovery, improving disease diagnosis, personalizing medicine, and enabling robotic surgery.\r\nFinance: AI powers fraud detection, algorithmic trading, risk management, and personalized financial advice.\r\nTransportation: Self-driving cars, optimized logistics, and intelligent traffic management systems are becoming a reality thanks to AI.\r\nRetail: AI is used for personalized recommendations, inventory management, and customer service through chatbots.\r\nManufacturing: AI-powered robots automate production processes, improve quality control, and predict equipment failures.\r\nEntertainment: AI is used for personalized content recommendations, game development, and creating special effects in movies.\r\nEducation: AI can personalize learning experiences, provide automated feedback, and assist teachers with administrative tasks.\r\nNavigating the Ethical Landscape:\r\n\r\nThe rapid advancement of AI presents us with a range of ethical considerations that demand careful attention:\r\n\r\nBias: AI algorithms can perpetuate and amplify existing biases in the data they are trained on, leading to unfair or discriminatory outcomes.\r\nJob Displacement: As AI automates tasks, there are concerns about potential job losses in certain sectors.\r\nPrivacy: AI systems often collect and analyze vast amounts of data, raising concerns about individual privacy and data security.\r\nAccountability: Determining responsibility when an AI system makes a mistake or causes harm is a complex issue.\r\nAutonomous Weapons: The development of AI-powered autonomous weapons systems raises serious ethical and security concerns.\r\nThe Future of AI: A World of Possibilities and Uncertainties:\r\n\r\nThe future of AI is brimming with both promise and uncertainty. While the potential benefits are immense, addressing the ethical challenges is crucial to ensure that AI is used for the betterment of humanity. Some key areas of future development include:\r\n\r\nExplainable AI (XAI): Making AI decision-making processes more transparent and understandable.\r\nArtificial General Intelligence (AGI): The hypothetical creation of AI with human-level intelligence and general-purpose problem-solving abilities.\r\nAI and Creativity: Exploring the potential of AI to generate creative content, such as art, music, and literature.\r\nConclusion: Embracing the AI Revolution Responsibly:\r\n\r\nArtificial intelligence is a transformative technology with the potential to reshape every facet of our existence. While challenges and ethical considerations exist, the opportunities presented by AI are immense. By fostering collaboration between researchers, policymakers, and the public, we can harness the power of AI to create a future where intelligent machines work alongside humans to solve some of the world\'s most pressing problems. Understanding its capabilities, limitations, and potential impact is crucial for navigating this rapidly evolving landscape and shaping the future of AI responsibly.', 2, 'admin', 'published', '2025-02-09 11:47:28', 1, 'download.jpeg'),
(14, 'জুলাই', '৫ অগাস্ট ২০২৪', 2, 'admin', 'published', '2025-02-11 11:27:26', 1, NULL),
(15, 'নতুন বাংলাদেশ ২.০: ডিজিটাল প্রগতি ও উন্নয়নের নতুন দিগন্ত', 'বিষয়বস্তু:\r\n\r\nবাংলাদেশ, একটি দেশ যার ইতিহাস সংগ্রাম, স্বাধীনতা এবং অসম্ভবকে সম্ভব করার গল্পে ভরপুর। সময়ের সাথে সাথে এই দেশটি নানা চ্যালেঞ্জ মোকাবিলা করে এগিয়ে যাচ্ছে। আর এখন, আমরা দাঁড়িয়ে আছি একটি নতুন যুগের সন্ধিক্ষণে—\"নতুন বাংলাদেশ ২.০\"। এটি শুধু একটি স্বপ্ন নয়, বাস্তবতার মাটিতে গড়ে উঠছে একটি ডিজিটাল, আধুনিক এবং উন্নত বাংলাদেশ।\r\n\r\nডিজিটাল বাংলাদেশ: স্বপ্ন থেকে বাস্তবতা\r\n২০০৯ সালে প্রধানমন্ত্রী শেখ হাসিনা \"ডিজিটাল বাংলাদেশ\" এর স্বপ্ন দেখিয়েছিলেন। আজ, সেই স্বপ্ন বাস্তবায়নের পথে অনেক দূর এগিয়েছে। ইন্টারনেটের ব্যাপক প্রসার, মোবাইল ব্যাংকিং, ই-গভর্নেন্স এবং ডিজিটাল সেবার মাধ্যমে বাংলাদেশের মানুষ এখন বিশ্বের সাথে তাল মিলিয়ে চলছে। গ্রামীণ অঞ্চল থেকে শুরু করে শহর—সবখানেই ডিজিটাল প্রযুক্তির ছোঁয়া লেগেছে। নতুন বাংলাদেশ ২.০ হচ্ছে এই ডিজিটাল বিপ্লবের পরবর্তী ধাপ, যেখানে প্রযুক্তি হবে উন্নয়নের মূল চালিকাশক্তি।\r\n\r\nঅর্থনৈতিক উন্নয়ন: নতুন সম্ভাবনার দুয়ার\r\nবাংলাদেশের অর্থনীতি গত এক দশকে ঈর্ষণীয় প্রবৃদ্ধি অর্জন করেছে। তৈরি পোশাক শিল্প, রেমিট্যান্স, কৃষি এবং ক্ষুদ্র ও মাঝারি শিল্পের বিকাশ দেশের অর্থনীতিকে নতুন উচ্চতায় নিয়ে গেছে। নতুন বাংলাদেশ ২.০ এর লক্ষ্য হলো এই উন্নয়নের ধারা অব্যাহত রাখা এবং টেকসই অর্থনৈতিক কাঠামো গড়ে তোলা। বিশেষ করে, ব্লু ইকোনমি, রোবোটিক্স, আর্টিফিশিয়াল ইন্টেলিজেন্স এবং গ্রিন টেকনোলজির মতো ক্ষেত্রে বাংলাদেশকে এগিয়ে নেওয়ার পরিকল্পনা নেওয়া হয়েছে।\r\n\r\nযুবশক্তি: নতুন বাংলাদেশের মূল চালিকা\r\nবাংলাদেশের সবচেয়ে বড় সম্পদ হলো তার যুবশক্তি। নতুন বাংলাদেশ ২.০ এর স্বপ্ন বাস্তবায়নে এই যুবশক্তির ভূমিকা অপরিসীম। শিক্ষা, গবেষণা এবং উদ্ভাবনী চিন্তার মাধ্যমে তরুণরা দেশকে এগিয়ে নিয়ে যাচ্ছে। সরকারের বিভিন্ন উদ্যোগ, যেমন ডিজিটাল লার্নিং প্ল্যাটফর্ম, স্টার্টআপ ফান্ড এবং স্কিল ডেভেলপমেন্ট প্রোগ্রাম, তরুণদের জন্য নতুন সুযোগ সৃষ্টি করছে।\r\n\r\nটেকসই উন্নয়ন: পরিবেশ ও প্রগতির সমন্বয়\r\nনতুন বাংলাদেশ ২.০ শুধু অর্থনৈতিক উন্নয়ন নয়, টেকসই উন্নয়নের দিকেও নজর দিচ্ছে। জলবায়ু পরিবর্তনের চ্যালেঞ্জ মোকাবিলা করে পরিবেশবান্ধব প্রযুক্তি এবং নীতি গ্রহণ করা হচ্ছে। সৌরশক্তি, বায়ুশক্তি এবং অন্যান্য নবায়নযোগ্য শক্তির ব্যবহার বৃদ্ধি করে বাংলাদেশ একটি সবুজ ভবিষ্যত গড়ে তুলতে চাইছে।\r\n\r\nসামাজিক উন্নয়ন: নারীর ক্ষমতায়ন ও সমতা\r\nনতুন বাংলাদেশ ২.০ এর আরেকটি গুরুত্বপূর্ণ দিক হলো সামাজিক উন্নয়ন। নারীর ক্ষমতায়ন, শিক্ষার সম্প্রসারণ এবং স্বাস্থ্যসেবার উন্নয়নের মাধ্যমে একটি সমতাভিত্তিক সমাজ গড়ে তোলার লক্ষ্য রয়েছে। নারীরা এখন রাজনীতি, অর্থনীতি এবং সমাজের প্রতিটি ক্ষেত্রে সক্রিয়ভাবে অংশগ্রহণ করছেন, যা দেশের উন্নয়নে গুরুত্বপূর্ণ ভূমিকা রাখছে।\r\n\r\nচ্যালেঞ্জ ও সম্ভাবনা\r\nনতুন বাংলাদেশ ২.০ এর পথে অনেক চ্যালেঞ্জ রয়েছে। দারিদ্র্য, বেকারত্ব, শিক্ষার মান এবং অবকাঠামোগত সীমাবদ্ধতা এখনও আমাদের উন্নয়নের পথে বাধা। তবে, এই চ্যালেঞ্জগুলোকে অতিক্রম করার জন্য প্রয়োজন সঠিক পরিকল্পনা, রাজনৈতিক সদিচ্ছা এবং জনগণের অংশগ্রহণ।\r\n\r\nউপসংহার\r\nনতুন বাংলাদেশ ২.০ শুধু একটি ধারণা নয়, এটি একটি অঙ্গীকার। এটি এমন একটি বাংলাদেশের স্বপ্ন, যেখানে প্রতিটি নাগরিকের মৌলিক চাহিদা পূরণ হবে, যেখানে প্রযুক্তি এবং উদ্ভাবন মানুষের জীবনকে সহজ করবে, এবং যেখানে উন্নয়নের সুফল সবার কাছে পৌঁছে যাবে। এই নতুন বাংলাদেশ গড়ে তুলতে আমাদের সবাইকে একসাথে কাজ করতে হবে। কারণ, এই দেশ আমাদের, এই স্বপ্ন আমাদের, এবং এই ভবিষ্যতও আমাদের।', 1, 'User 1', 'published', '2025-02-11 11:36:09', 1, 'unb-1640061387104.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'User 1', 'user@demo.com', 'scrypt:32768:8:1$L58k7ttdHrP30W4K$933674f05508e856cf6eab3b0ea3dc26895873cbda15d92dc78c504424bc7af94e25ffb8ecc0ec5a903bf80d458f123674909d72f5dab1bf3d95e780f5a7729d', 'user'),
(2, 'admin', 'admin@demo.com', 'scrypt:32768:8:1$tCr7MhGA4Ygg8NDA$9d840db7b77b891727d14bb851131143f8be9fa3bd5b50f37c08e1e7014039a2071dea35231ce7afeddc2666a1cd2d340325b36bf57e48acc03c3f4f9628f056', 'admin'),
(3, 'User 2', 'user2@demo', 'scrypt:32768:8:1$pfGkTa8muofqbFaZ$51e582c1978a04a6c6de4e9b56f36a98e1e1835895c842cec0de984998e2df73dd5733a5b08e79a7854badba877d864dbbd06158b6cdf7ee5fdb6421f11c1e85', 'user'),
(4, 'Rahim', 'rahim@demo.com', 'scrypt:32768:8:1$xOfmCZXR9evVZo7D$250c75923f944d24a17f2a4a604e84eb6c0d2190ae601311294da5e239f29e162a935b7f11170b00ac2ddbf3f96185f7ce6cb2b11eaee3824650131f0530eb55', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
