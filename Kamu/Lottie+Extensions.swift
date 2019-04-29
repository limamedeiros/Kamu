import Lottie
import UIKit

extension AnimationView {
  convenience init(asset name: String,
                   bundle: Bundle = Bundle.main,
                   imageProvider: AnimationImageProvider? = nil,
                   animationCache: AnimationCacheProvider? = LRUAnimationCache.sharedCache) {
    let animation = Animation.asset(name, bundle: bundle, subdirectory: nil, animationCache: animationCache)
    let provider = imageProvider ?? BundleImageProvider(bundle: bundle, searchPath: nil)
    self.init(animation: animation, imageProvider: provider)
  }
}

extension Animation {
  static func asset(_ name: String,
                    bundle: Bundle = Bundle.main,
                    subdirectory: String? = nil,
                    animationCache: AnimationCacheProvider? = nil) -> Animation? {
    /// Create a cache key for the animation.
    let cacheKey = bundle.bundlePath + (subdirectory ?? "") + "/" + name

    /// Check cache for animation
    if let animationCache = animationCache,
      let animation = animationCache.animation(forKey: cacheKey) {
      /// If found, return the animation.
      return animation
    }

    guard let data = NSDataAsset(name: name)?.data else {
      return nil
    }

    do {
      let animation = try JSONDecoder().decode(Animation.self, from: data)
      animationCache?.setAnimation(animation, forKey: cacheKey)
      return animation
    } catch {
      return nil
    }
  }
}
