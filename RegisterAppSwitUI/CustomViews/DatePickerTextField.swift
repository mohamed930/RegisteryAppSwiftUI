//
//  DatePickerTextField.swift
//  RegisterAppSwitUI
//
//  Created by Mohamed Ali on 28/06/2025.
//


import SwiftUI

struct DatePickerTextField: UIViewRepresentable {
    
    var placeholder: String
    var dateFormat: String
    @Binding var selectedDate: String
    
    private let textField = UITextField()
    private let pickerView = UIDatePicker()
    private let helper = Helper()
    
    class Coordinator: NSObject {
        var parent: DatePickerTextField
        
        init(_ parent: DatePickerTextField) {
            self.parent = parent
        }
        
        @objc func dateChanged(_ sender: UIDatePicker) {
            let formatter = DateFormatter()
            formatter.dateFormat = parent.dateFormat
            parent.textField.text = formatter.string(from: sender.date)
            parent.selectedDate = formatter.string(from: sender.date)
        }
        
        @objc func doneButtonHandler() {
//            if parent.selectedDate == nil {
//
//            }
            
            let formatter = DateFormatter()
            formatter.dateFormat = parent.dateFormat
            parent.textField.text = formatter.string(from: parent.pickerView.date)
            parent.selectedDate = formatter.string(from: parent.pickerView.date)
            
            parent.textField.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        pickerView.datePickerMode = .date
        pickerView.preferredDatePickerStyle = .wheels
        pickerView.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(_:)), for: .valueChanged)
        
        textField.placeholder = placeholder
        textField.inputView = pickerView
        
//        textField.addPadding(amount: -32, PlaceHolder: placeholder, Color: .gray)
        
        // Add toolbar with Done button
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonHandler))
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolBar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
//        if let selectedDate = selectedDate {
//
//        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        uiView.text = selectedDate // formatter.string(from: selectedDate)
    }
    
    class Helper {
        var doneHandler: (() -> Void)?
        @objc func doneButtonHandler() {
            doneHandler?()
        }
    }
}



struct DatePickerTextFieldComponents: View {
    
    @Binding var txt: String
    var placeHolder: String
    
    var body: some View {
        
        DatePickerTextField(placeholder: placeHolder, dateFormat: "dd/MM/yyyy", selectedDate: $txt)
            .frame(height: 24)
            .padding(.horizontal,-32)
        
    }
}

extension UITextField {
    
    private func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    private func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addPadding(amount:CGFloat, PlaceHolder:String , Color: UIColor) {
        setLeftPaddingPoints(amount)
        setRightPaddingPoints(amount)
        
        self.attributedPlaceholder = NSAttributedString(string: PlaceHolder,
                attributes: [NSAttributedString.Key.foregroundColor: Color])
    }
}


#Preview {
    @State var date: String = ""
    return DatePickerTextFieldComponents(txt: $date, placeHolder: "Pick Date")
}
