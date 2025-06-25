import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_sync/model/onboarding_model.dart';
import 'package:heart_sync/model/question_model.dart';

class StaticResources {
  /// A List of gender options for the user to select from.
  static final List<OnboardingModel> genderOptionList = [
    OnboardingModel(title: "Male", isSelected: false),
    OnboardingModel(title: "Female", isSelected: false),
    OnboardingModel(title: "Other", isSelected: false),
  ];

  /// A List of looking for options for the user to select from.
  static final List<OnboardingModel> lookingForOptionList = [
    OnboardingModel(
      title: "Long-term partner",
      isSelected: false,
      imagePath: Icons.favorite,
    ),
    OnboardingModel(
      title: "Long-term, open to short",
      isSelected: true,
      imagePath: Icons.ac_unit_rounded,
    ),
    OnboardingModel(
      title: "Short-term, open to long",
      isSelected: true,
      imagePath: Icons.access_alarm,
    ),
    OnboardingModel(
      title: "Short-term fun",
      isSelected: true,
      imagePath: Icons.face_unlock_outlined,
    ),
    OnboardingModel(
      title: "New Friends",
      isSelected: true,
      imagePath: Icons.back_hand_sharp,
    ),
    OnboardingModel(
      title: "Still figuring",
      isSelected: true,
      imagePath: Icons.cabin,
    ),
  ];

  /// A List of relationship status options for the user to select from.
  static final List<QuestionModel> lifeStyleOptionList = [
    QuestionModel(
      title: "How often do you drink?",
      key: "drink",
      options: StaticResources.drinkingList,
      icon: Icons.local_bar,
    ),
    QuestionModel(
      title: "How often do you smoke?",
      key: "smoke",
      options: StaticResources.smokingList,
      icon: Icons.smoking_rooms,
    ),
    QuestionModel(
      title: "Do you workout?",
      key: "workout",
      options: StaticResources.workOutList,
      icon: Icons.fitness_center,
    ),
    QuestionModel(
      title: "Do you have any pets?",
      key: "pets",
      options: StaticResources.petList,
      icon: Icons.pets,
    ),
  ];

  /// A List of thought options for the user to select from.
  static final List<QuestionModel> thoughtOptionList = [
    QuestionModel(
      title: "What is your communication style?",
      key: "communication",
      options: communicationStyleList,
      icon: CupertinoIcons.chat_bubble_text,
    ),
    QuestionModel(
      title: "How do you receive love?",
      key: "loveStyle",
      options: loveStyleList,
      icon: Icons.favorite,
    ),
    QuestionModel(
      title: "What is your education level?",
      key: "education",
      options: educationList,
      icon: Icons.school,
    ),
    QuestionModel(
      title: "What is your zodiac sign?",
      key: "zodiac",
      options: zodiacList,
      icon: Icons.star_half,
    ),
  ];


  /// A List of interest options for the user to select from.
  static final List<String> interestOptionList = [
    "Harry Potter",
    "SoundCloud",
    "Spa",
    "Self Care",
    "Heavy Metal",
    "House Parties",
    "Gin tonic",
    "Gymnastics",
    "Ludo",
    "Maggi",
    "Hot Yoga",
    "Documentaries",
    "Biryani",
    "Drama shows",
    "Meditation",
    "Foodie",
    "Sushi",
    "Spotify",
    "Hockey",
  ];

  /// A List of pronouns options for the user to select from.
  static final List<String> pronounsList = [
    "He/Him",
    "She/Her",
    "They/Them",
    "Other",
  ];

  /// A List of relationship status options for the user to select from.
  static final List<String> relationshipStatusList = [
    "Monogamy",
    "Ethical non-monogamy",
    "Polyamory",
    "Open to exploring",
  ];

  /// A List of language options for the user to select from.
  static final List<String> languageList = [
    "English",
    "Hindi",
    "French",
    "German"
  ];

  /// A List of zodiac signs options for the user to select from.
  static final List<String> zodiacList = [
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn",
    "Aquarius",
    "Pisces"
  ];

  /// A List of education options for the user to select from.
  static final List<String> educationList = [
    "Bachelors",
    "In College",
    "High School",
    "Masters",
    "PhD",
    "In Grad School",
    "Trade School"
  ];

  /// A List of family plan options for the user to select from.
  static final List<String> familyPlanList = [
    "I want children",
    "I don't want children",
    "I have children and want more",
    "I have children and dont want more"
  ];

  /// A list of Covid options for the user to select from.
  static final List<String> covidStatusList = [
    "Vaccinated",
    "Not Vaccinated",
    "Prefer not to say"
  ];

  /// A list of personality types options for the user to select from.
  static final List<String> personalityTypeList = [
    "INTJ",
    "INTP",
    "ENTJ",
    "ENTP",
    "INFJ",
    "INFP",
    "ENFJ",
    "ENFP"
  ];

  /// A list of communication styles options for the user to select from.
  static final List<String> communicationStyleList = [
    "I stay on WhatsApp all day",
    "Big time texter",
    "Phone Caller",
    "Video chatter",
    "I'm slow to answer on WhatsApp",
    "Bad Texter",
    "Better in person"
  ];

  /// A list of love styles options for the user to select from.
  static final List<String> loveStyleList = [
    "Thoughtful gestures",
    "Presents",
    "Touch",
    "Compliments",
    "Time together"
  ];

  /// A list of pets
  static final List<String> petList = [
    "Dog",
    "Cat",
    "Reptile",
    "Fish",
    "Bird",
    "Don't have but love"
  ];

  /// A list of drinking options for the user to select from.
  static final List<String> drinkingList = [
    "Not for me",
    "Sober",
    "Sober curious",
    "On Special occasions",
    "Socially on weekends",
    "Most Nights"
  ];

  /// A list of smoking options for the user to select from.
  static final List<String> smokingList = [
    "Non smoker",
    "Smoker when drinking",
    "Social smoker",
    "Smoker",
    "Trying to quit"
  ];

  /// A list of workout options for the user to select from.
  static final List<String> workOutList = [
    "Everyday",
    "Often",
    "Sometimes",
    "Never",
  ];
}
