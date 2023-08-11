//
//  FittingController.swift
//  apparelfit
//
//  Created by Noah Miyabayashi on 2023/07/26.
//

import Foundation
import Firebase
import UIKit
import AVFoundation
import Koloda

class FittingController: UIViewController {
    // MARK: - Properties
    let label: UILabel = {
        let label = UILabel()
        label.text = "FittingController"
        return label
    }()
    lazy var kolodaView: KolodaView? = {
        let kv = KolodaView()
        
        return kv
    }()
    var captureSession = AVCaptureSession()
    var innerCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    var photoOutput : AVCapturePhotoOutput?
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    
    var images = [UIImage(named: "help1.jpg"), UIImage(named: "help2.PNG")]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 100)
        
        setupCaptureSession()
        setupDevice()
        //setupInputOutput()
        setupPreviewLayer()
        captureSession.startRunning()
        
        kolodaView?.dataSource = self
        kolodaView?.delegate = self
        
        view.addSubview(kolodaView!)
        kolodaView!.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 22, paddingLeft: 50, width: 110, height: 220)
        
    }
    
    
    // MARK: - API
    // MARK: - Selectors
    // MARK: - Helpers
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        // カメラデバイスのプロパティ設定
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        // プロパティの条件を満たしたカメラデバイスの取得
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            //            if device.position == AVCaptureDevice.Position.back {
            //                mainCamera = device
            //            } else if device.position == AVCaptureDevice.Position.front {
            //                innerCamera = device
            //            }
            innerCamera = device
        }
        // 起動時のカメラを設定
        //        currentDevice = mainCamera
        currentDevice = innerCamera
    }
    
    //    func setupInputOutput() {
    //        do {
    //            // 指定したデバイスを使用するために入力を初期化
    //            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
    //            // 指定した入力をセッションに追加
    //            captureSession.addInput(captureDeviceInput)
    //            // 出力データを受け取るオブジェクトの作成
    //            photoOutput = AVCapturePhotoOutput()
    //            // 出力ファイルのフォーマットを指定
    //            photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
    //            captureSession.addOutput(photoOutput!)
    //        } catch {
    //            print(error)
    //        }
    //    }
    func setupPreviewLayer() {
        // 指定したAVCaptureSessionでプレビューレイヤを初期化
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // プレビューレイヤが、カメラのキャプチャーを縦横比を維持した状態で、表示するように設定
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        // プレビューレイヤの表示の向きを設定
        self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        self.cameraPreviewLayer?.frame = view.frame
        self.view.layer.insertSublayer(self.cameraPreviewLayer!, at: 0)
    }
}
    // MARK: -KolodaViewDelegate/DataSource
extension FittingController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
    }
}

extension FittingController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 2
    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: images[index])
    }

//    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
//        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
//    }
}
