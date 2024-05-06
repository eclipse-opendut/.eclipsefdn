local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-opendut') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Test Electronic Control Units around the world in a transparent network.",
    name: "Eclipse openDuT",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('.github') {
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('opendut') {
      delete_branch_on_merge: false,
      description: "Test Electronic Control Units around the world in a transparent network.",
      has_discussions: true,
      has_wiki: false,
      homepage: "https://opendut.eclipse.dev",
      gh_pages_build_type: "workflow",
      topics+: [
        "automotive"
      ],
      web_commit_signoff_required: false,
      variables: [
        orgs.newRepoVariable('OPENDUT_GH_RUNNER_LARGE') {
          value: "[\"ubuntu-latest\"]",
        },
        orgs.newRepoVariable('OPENDUT_GH_RUNNER_SMALL') {
          value: "[\"ubuntu-latest\"]",
        },
        orgs.newRepoVariable('OPENDUT_RUN_TESTENV') {
          value: "false",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "status-check"
          ],
          requires_conversation_resolution: true,
        },
      ],
      rulesets: [
        orgs.newRepoRuleset('protect-development-branch') {
          allows_force_pushes: true,
          allows_updates: true,
          include_refs+: [
            "refs/heads/development"
          ],
          required_approving_review_count: null,
          requires_commit_signatures: false,
          requires_pull_request: false,
          requires_status_checks: false,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "main",
            "development",
             "v[0-9].[0-9].[0-9]",
             "v[0-9].[0-9].[0-9]-*"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('cannelloni') {
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      description: "Build cannelloni for multiple architectures.",
      has_wiki: false,
      homepage: "https://github.com/mguentner/cannelloni",
    },
  ],
}
