---
layout: markdown_page
title: "Engineering Workflow"
---

This document explains the workflow for anyone working with issues in GitLab Inc.
For the workflow that applies to everyone please see [PROCESS.md](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/PROCESS.md).

**Table of contents**

- TOC
{:toc}

## GitLab Flow

Products at GitLab are built using the [GitLab Flow](http://doc.gitlab.com/ee/workflow/gitlab_flow.html).

## Basics

1. Start working on an issue you’re assigned to. If you’re not assigned to any issue, find the issue with the highest priority you can work on, by relevant label. [You can use this query, which sorts by priority for the upcoming milestone][priority-issues], and filter by the label for your team.
1. If you need to schedule something or prioritize it, apply the appropriate labels. See below for details.
1. You are responsible for the issue that you're assigned to. This means it has
  to ship with the milestone it's associated with. If you are not able to do
  this, you have to communicate it early to your manager. In teams, the team is
  responsible for this (see below).
1. You (and your team, if applicable) are responsible for:
  - ensuring that your changes [apply cleanly to GitLab Enterprise Edition][ce-ee-docs].
  - the testing of a new feature or fix, especially right after it has been
    merged and packaged.
1. Once a release candidate has been deploy in the staging environment, please
  verify that your changes work as intended. We have seen issues where bugs did
  not appear in development but showed in production (e.g. due to CE-EE merge
  issues).

[ce-ee-docs]: https://docs.gitlab.com/ee/development/limit_ee_conflicts.html
[priority-issues]: https://gitlab.com/groups/gitlab-org/issues?scope=all&sort=priority&state=opened&milestone_title=%23upcoming&assignee_id=0

## Working in Teams

For larger issues or issues that contain many different moving parts,
you'll be likely working in a team. This team will typically consist of a
[backend developer](https://about.gitlab.com/jobs/developer/), a
[frontend developer](https://about.gitlab.com/jobs/frontend-engineer/), a
[UX designer](https://about.gitlab.com/jobs/ux-designer/) and a
[product manager](https://about.gitlab.com/jobs/product-manager/).

1. Teams have a shared responsibility to ship the issue in the planned release.
    1. If the team suspects that they might not be able to ship something in
  time, the team should escalate / inform others as soon as possible.
  A good start is informing your lead.
    1. It's generally preferable to ship a smaller iteration of an issue,
  than ship something a release later.
1. Consider starting a Slack channel for a new team,
but remember to write all relevant information in the related issue(s).
You don't want to have to read up on two threads, rather than only one, and
Slack channels are not open to the greater GitLab community.

## Choosing something to work on

Start working on things with the highest priority in the current milestone. The
priority of items are defined under labels in the repository, but you are able
to sort by priority.

After sorting by priority, choose something that you’re able to tackle and falls
under your responsibility. That means that if you’re a frontend developer,
you work on something with the label `Frontend`.

To filter very precisely, you could filter all issues for:

- Milestone: Upcoming
- Assignee: Unassigned
- Label: Your label of choice. For instance `CI`, `Discussion`, `Edge`, `Frontend`, or `Platform`
- Sort by priority

[Use this link to quickly set the above parameters][priority-issues]. You'll
still need to filter by the label for your own team.

If you’re in doubt about what to work on, ask your lead. They will be able to tell you.

## Getting your merge request reviewed, approved, and merged

See the guidelines in our [Contribution guide][contrib-mr-guide].

[contrib-mr-guide]: https://gitlab.com/gitlab-org/gitlab-ce/blob/master/CONTRIBUTING.md#getting-your-merge-request-reviewed-approved-and-merged

## Getting data about GitLab.com

GitLab.com is a very large instance of GitLab Enterprise Edition.
It runs release candidates for new releases, and sees a lot of issues because of the amount of traffic it gets.
There are several internal tools available for developers at GitLab to get data about what's happening in the production system:

### Performance data

- [performance.gitlab.net](https://performance.gitlab.net/) has detailed
  performance data GitLab.com, including
  [GitLab performance monitoring](https://docs.gitlab.com/ce/administration/monitoring/performance/introduction.html)
  data
  - [monitor.gitlab.net](http://monitor.gitlab.net/) has some of the same
    dashboards available to the public
- [GitLab profiler data](http://redash.gitlab.com/dashboard/gitlab-profiler-statistics)
  is a dashboard with links to
  [request profiles](https://docs.gitlab.com/ee/administration/monitoring/performance/request_profiling.html)
  and SQL queries run when loading pages on GitLab.com
  - To add a page to this dashboard, create a merge request to the
    [gitlab-com/gitlab-profiler](https://gitlab.com/gitlab-com/gitlab-profiler)
    project

### Error reporting

- [Sentry](https://sentry.gitlap.com/) is our error reporting tool
- [log.gitlap.com](https://log.gitlap.com/) has production logs
- [prometheus.gitlab.com](https://prometheus.gitlab.com/alerts) has alerts for
  the [production team](/handbook/infrastructure/#production-team)

## Labelling issues

To allow for asynchronous issue handling, we use milestones and labels.
Leads and product managers handle most of the scheduling into milestones. Labelling is a task for everyone.

Most issues will have labels for at least one of the following:

- Team (`CI`, `Discussion`, `Edge`, `Frontend`, `Platform`, etc.)
- Subject (`wiki`, `container registry`, etc.)
- Type (`feature proposal`, `bug`, `customer`, etc.)
- Priority (`Deliverable`, `Stretch`)

If you come across an issue that has none of these, you can _always_ add the team and type, and often also the subject.

All labels, their meaning and priority are defined on the
[labels page][labels-page].

[labels-page]: https://gitlab.com/gitlab-org/gitlab-ce/labels

### Team labels (`CI`, `Discussion`, `Edge`, `Frontend`, `Platform`, etc.)

Team labels specify what team is responsible for this issue.
Assigning a team label makes sure issues get the attention of the appropriate people.

The current team labels are `CI`, `Discussion`, `Documentation`, `Edge`, `Frontend`, `Packaging`, `Platform`, `Prometheus`, `Release`, and `UX`.
The descriptions on the [labels page][labels-page] explain what falls under the responsibility of each team.

Team labels are always colored aqua, and are capitalized so that they show up as the first label for any issue.

### Subject labels (`wiki`, `container registry`, etc.)

Subject labels are labels that define what area or feature of GitLab this issue hits.
They are not always necessary, but very convenient.
If you are an expert in a particular area, it makes it easier to find issues to work on.

Examples of subject labels are `api`, `wiki`, `issues`, `merge request`, `labels`, and `container registry`.

Subject labels are always colored blue and all-lowercase.

### Type labels (`feature proposal`, `bug`, `customer`, etc.)

Type labels are very important. They define what kind of issue this is. Every issue should have one or more. Examples of types are:

Examples of type labels are `bug`, `feature proposal`, `security`, `customer`, and `direction`.

A number of type labels have a priority assigned to them, which automatically makes them float to the top, depending on their importance.

Type labels are always lowercase, but can have any color, besides blue (which is already reserved for subject labels).
The descriptions on the [labels page][labels-page] explain what falls under each type label.

### Priority labels (`Deliverable` and `Stretch`)

Priority labels help us clearly communicate expectations of the work for the release. There are two levels of priority labels:

- `Deliverable`: Issues that are expected to be delivered in this milestone.
- `Stretch`: Issues that are a stretch goal for delivering in this milestone. If these issues are not done in the current release, they will strongly be considered for the next release.

Work with your lead if you feel that there are too many `Deliverable` issues scheduled for the current release.

### Label for community contributors (`Accepting Merge Requests`)

Issues that are beneficial to our users, 'nice to haves', that we currently
do not have the capacity for or want to give the priority to, are labeled as
`Accepting Merge Requests`, so the community can make a contribution.

Community contributors can submit merge requests for any issue they want,
but `Accepting Merge Requests` label has a special meaning. It points to
changes that we already agreed on, are well-defined, and are likely to get
accepted by a merge request endboss. We want to avoid a situation when a
contributor picks an `Accepting Merge Requests` issue and then their merge
request gets closed, because we realize that it does not fit our vision
and or we want to solve it in a different way.

We add the `Accepting Merge Requests` label to:

- low priority bugs (i.e. we do not add it to the bugs that we want to
solve in the next patch release)
- small features if they do not need UX / product work or UX / product work
is already done
- small technical debt issues

After adding `Accepting Merge Requests` label, we try to estimate the weight of
the issue. We use issue weight to let contributors know how difficult the
issue is. Additionally:

- we advertise `Accepting Merge Requests` issues with weight < 5 as suitable
for people that have never contributed to GitLab before on the
[Up For Grabs campaign](http://up-for-grabs.net)
- we encourage people that have never contributed to any open source project
to look for `Accepting Merge Requests` issues with weight 1

Of course, the weight is only an estimate, but you (as a person familiar with
GitLab codebase) are more likely to estimate correctly than a potential
contributor who is new to GitLab. However, if you are unable to provide
an estimate, it is better to leave the issue without weight, so we do not
make a false promise that the issue is suitable for new contributors.

## Scheduling issues

GitLab Inc has to be selective in working on particular issues.
We have a limited capacity to work on new things. Therefore, we have to
schedule issues carefully. This is done primarily by product and
engineering managers.

Each issue that is scheduled should meet most of these criteria:

1. It should be in line with our [vision for GitLab](https://about.gitlab.com/direction/#vision)
1. It benefits our users
1. It is [technically viable](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/CONTRIBUTING.md#contribution-acceptance-criteria)
1. The technical complexity is acceptable (we want to preserve our ability to make changes quickly in the future so we try to avoid: complex code, complex data structures, and optional settings)
1. It is orthogonal to other features (prevent overlap with current and future features)
1. Its requirements are clear
1. It can be achieved within the scheduled milestone.
Larger issues should be split up, so that individual steps can be achieved
within a single milestone.

Direction issues are the big, prioritized new features for each release.
They are limited to a small number per release so that we have plenty of
capacity to work on other important issues, bug fixes, etc.

Issues that are not scheduled for a future milestone,
but we are committed to doing, are put in the Backlog milestone.

If you want to schedule an `Accepting Merge Requests` issue, please remove
the label first.

Any scheduled issue should have a team label assigned, and at least one type label.

### Requesting something to be scheduled

Only fleshed-out issues can be scheduled. If an issue is vague or has unclear requirements, we can not schedule it.

To request a scheduling of an issue, ask the responsible lead.
You can find the leads on the team page, and in the descriptions of the team labels.
For (major) feature requests, ask the relevant product manager. Right now this is either Mark (for CI) or Job.

We have much more requests for great features than we have capacity to work on.
There is a good chance we’ll not be able to work on something.
Make sure the appropriate labels (such as `customer`) are applied so every issue is given the priority it deserves.

### Scheduling issues into a milestone

Engineering and product schedule (establish scope of) which issues are to be worked on in the following milestone. In particular:
* Engineering leads are responsible for resource planning and allocation.
* Engineering leads are responsible for prioritizing bugs and tech debt.
* Product managers are responsible for prioritizing features, with feedback from all relevant stakeholders.
* Based on the above, engineering leads and product managers collaborate and establish scope by the **4th** of a month, for the release in the subsequent month,
according to the [scheduling timeline](https://about.gitlab.com/handbook/product/#scheduling-timeline-throughout-a-milestone).
* The entire process happens asynchronously, and is mediated through individual issues themselves.


### Process improvement

There is an informal scheduling process discussion in the #scheduling Slack channel.
Anyone can join and suggest improvements to our scheduling process.
