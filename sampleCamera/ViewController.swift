//
//  ViewController.swift
//  sampleCamera
//
//  Created by Eriko Ichinohe on 2017/09/13.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//カメラ撮影に必要なプロトコルを追加
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //カメラボタンが押された時発動
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        
        //カメラが使えるかどうか判別するための情報を取得（列挙体 P.286）
        let camera = UIImagePickerControllerSourceType.camera
        
        //カメラが使える場合
        if UIImagePickerController.isSourceTypeAvailable(camera){
            
            // ImagePickerControllerオブジェクトを生成
            let picker = UIImagePickerController()
            
            // カメラタイプと設定
            picker.sourceType = camera
            
            // デリゲートの設定（撮影後のメソッドを感知するため）
            picker.delegate = self
            
            // ImagePickerの表示(モーダル)
            present(picker,animated: true,completion: nil)
            
        }
        
        
    }
    
    //カメラで撮影し終わった後に発動するメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //imageViewに撮影した写真をセットするために、imageを保存
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //imageViewに設定
        pictureImageView.image = image
        
        // 自分のデバイス（今このプログラムが動いてる場所）に写真を保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        // モーダルで表示した写真撮影用の画面を閉じる（前の画面に戻る）
        dismiss(animated: true, completion: nil)
        
        //P.264のinfo.plistの設定が必要
        //iPhoneでエラーが出た場合、P.227をチェック！
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

