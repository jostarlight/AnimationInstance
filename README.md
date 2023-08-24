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

# 通过ab包来加载预制体
1、animationmanager中的异步加载animationtexture的ab的方法可以改成同步的，包括在editor中采用resources.load

2、通过ab加载预制体，需要在graphics setting中设置instancing variant为keep all，使得所有变体都会被保留，这样使得安卓用ab加载animationinstancing预制体也能显示，注意的是在editor中仍然无法显示，需要打包测试

# 使用自己的shader
1、shader中添加            
`#include "AnimationInstancingBase.cginc"`
需要在所有include的最后

2、使用自己的shader需要在pass中的vert方法调用AnimationInstancingBase.cginc的vert方法，参数类型为appdata_full，并且改个名字如：
```C
#pragma vertex vertt
v2f vertt (appdata_full v){
}
```
3、vertt中需要添加
```
UNITY_SETUP_INSTANCE_ID(v);
vert(v);
```

例：
```
v2f vertt (appdata_full v)
{
    UNITY_SETUP_INSTANCE_ID(v);//为每个实体编号
    v2f o;
    vert(v);//调用AnimationInstancingBase.cginc中的vert方法
    o.vertex = UnityObjectToClipPos(v.vertex);
    o.texcoord =v.texcoord;// TRANSFORM_TEX(v.texcoord, _Diffuse);
    o.normalDir = UnityObjectToWorldNormal(v.normal);
    o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
    o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
    o.posWorld = mul(unity_ObjectToWorld, v.vertex);
    UNITY_TRANSFER_FOG(o,o.vertex);
    return o;
}
```

# 关于在低端机上该组件与animator的帧率比较

如果使用github上官方组件，条件为渲染90个相同蒙皮动画
最终效果animationinstancing会低于animator
在采用该工程中的修改后帧数高于animator

# 修改内容
1、AnimationInstancingBase.cginc修改，去掉无用计算，动画fbx上设置bones数量从4改为2，在项目中看动画效果差别不大，对于低端机来说可以接受。

2、ab包加载修改，加载bytes文件改为同步加载，需要接入自己项目中的热更系统
