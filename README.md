# AnimationInstance使用demo
slg使用unity官方AnimationInstancing时发现，在低端机上对比animationInstancing和Animator组件反而AnimationInstancing效果不好，需要进行优化。

# slg中需求
1、场景一中三种skinmeshrenderer，搭配骨骼动画，每种角色30人，共3种角色90人

2、场景二种多种skinmeshrenderer，骨骼动画，大约90左右

3、每个人物只需要站着，播放单一动画"idle"

# AnimationInstancing使用
1、预制体挂AnimationInstancing组件，使用插件生成AnimationTexture

2、fbx需要开启read/write

3、material需要开启enable gpu instance（Android端需要）

4、生成需要通过AnimationInstancingMgr中createInstance方法生成

5、如果是预制体中的子对象是AnimationInstancing，则直接Instantiate即可

# 修改内容
1、AnimationInstancingBase.cginc修改，去掉无用计算，动画bones数量从4改为2，在项目中看动画效果差别不大。
