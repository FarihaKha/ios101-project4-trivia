//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Fariha Kha on 7/8/25.
//

import Foundation

class TriviaQuestionService {
    static func fetchQuestions(completion: @escaping ([TriviaQuestion]?) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=5&type=multiple")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error fetching questions: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(TriviaAPIResponse.self, from: data)
                let questions = result.results.map { apiQuestion in
                    return TriviaQuestion(
                        category: apiQuestion.category,
                        question: apiQuestion.question.htmlDecoded,
                        correctAnswer: apiQuestion.correct_answer.htmlDecoded,
                        incorrectAnswers: apiQuestion.incorrect_answers.map { $0.htmlDecoded }
                    )
                }
                completion(questions)
            } catch {
                print("Error decoding questions: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    private struct TriviaAPIResponse: Decodable {
        let results: [APIQuestion]
    }
    
    private struct APIQuestion: Decodable {
        let category: String
        let question: String
        let correct_answer: String
        let incorrect_answers: [String]
    }
}

extension String {
    var htmlDecoded: String {
        guard let data = data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        return attributedString.string
    }
}
