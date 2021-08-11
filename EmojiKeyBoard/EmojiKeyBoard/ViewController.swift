//
//  ViewController.swift
//  EmojiKeyBoard
//
//  Created by Apple on 2021/8/11.
//  Copyright © 2021 马大哈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = 
        
        self.view.addSubview(self.topView)
        self.topView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
        }
        
        self.topView.addSubview(self.textView)
        self.textView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(40)
            
            if#available(iOS 11.0, *) {
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.bottom.equalTo(self.bottomLayoutGuide.snp.bottom)
            }
        }
        
        self.topView.addSubview(self.emojiBtn)
       
        self.emojiBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalTo(self.textView.snp.right)
            make.width.height.equalTo(40)
        }
    }

    lazy var topView: UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = .red
        return view;
    }()
    
    lazy var textView: MagicTextView = {
        let view = MagicTextView.init(frame: .zero)
        view.backgroundColor = .gray
        view.delegate = self
        return view
    }()

    lazy var emojiBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "btn_face"), for: .normal)
        btn.setImage(UIImage(named: "btn_keyboard"), for: .selected)
        btn.addTarget(self, action: #selector(emojiBtnTouched), for: .touchUpInside)
        return btn
    }()
    
   
    @objc private func emojiBtnTouched() {
        
        
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
}
