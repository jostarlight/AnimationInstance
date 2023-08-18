using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class test : MonoBehaviour
{
    [SerializeField] private AnimationInstancing.AnimationInstancing[] anis;

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(100, 100, 200, 2000));

        if (GUILayout.Button("切换动画"))
        {
            for (int i = 0; i < anis.Length; i++)
            {
                anis[i].PlayAnimation("idle");
            }
        }
        if (GUILayout.Button("停止动画"))
        {
            for (int i = 0; i < anis.Length; i++)
            {
                anis[i].Pause();
            }
        }
        if (GUILayout.Button("开始动画"))
        {
            for (int i = 0; i < anis.Length; i++)
            {
                anis[i].Resume();
            }
        }
        GUILayout.Label("当前动画：" + anis[0].aniInfo[anis[0].aniIndex].animationName);
        GUILayout.Label("当前动画IsPause：" + anis[0].IsPause());
        GUILayout.Label("当前动画IsPlaying：" + anis[0].IsPlaying());
        GUILayout.Label("当前动画IsLoop：" + anis[0].IsLoop());
        GUILayout.Label("当前动画IsReady：" + anis[0].IsReady());

        if (GUILayout.Button("生成"))
        {
            var go = Resources.Load<GameObject>("RoleRelated/Roles/Prefabs/airensheshou_skin");
            AnimationInstancing.AnimationInstancingMgr.Instance.CreateInstance(go);
        }


        GUILayout.EndArea();
    }

}
